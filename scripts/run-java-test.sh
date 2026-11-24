#!/usr/bin/env bash

set -euo pipefail

if [[ -z "${JAVA_HOME:-}" || ! -x "$JAVA_HOME/bin/java" || ! -x "$JAVA_HOME/bin/javac" ]]; then
  echo "Export JAVA_HOME pointing to a compatible JDK before running this test." >&2
  exit 1
fi

VIMFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VIMFILES_PLUGIN_DIR="${VIMFILES_PLUGIN_DIR:-$HOME/.vim/plugged}"
export VIMFILES_ROOT VIMFILES_PLUGIN_DIR

for entry in coc.nvim/build/index.js coc-java/lib/index.js; do
  if [[ ! -f "$VIMFILES_PLUGIN_DIR/$entry" ]]; then
    echo "Missing built plugin entry point: $VIMFILES_PLUGIN_DIR/$entry" >&2
    exit 1
  fi
done

JAVA_TEST_DIR="$(mktemp -d)"
export JAVA_TEST_DIR
trap 'rm -rf "$JAVA_TEST_DIR"' EXIT

mkdir -p "$JAVA_TEST_DIR/project" "$JAVA_TEST_DIR/home"
printf 'public class Main {}\n' > "$JAVA_TEST_DIR/project/Main.java"
export HOME="$JAVA_TEST_DIR/home"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS:-} -Duser.home=$HOME"
cd "$JAVA_TEST_DIR/project"

if nvim --headless -i NONE -u "$VIMFILES_ROOT/test/java-init.vim" \
    Main.java -S "$VIMFILES_ROOT/test/java-startup.vim" \
    > "$JAVA_TEST_DIR/editor.log" 2>&1; then
  cat "$JAVA_TEST_DIR/editor.log"
else
  cat "$JAVA_TEST_DIR/editor.log" >&2
  find "$JAVA_TEST_DIR" -type f -name '*.log' ! -name editor.log \
    -exec tail -n 80 {} \; >&2
  exit 1
fi
