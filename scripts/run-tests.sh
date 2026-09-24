#!/usr/bin/env bash

set -e
set -u
set -o pipefail

EDITOR_BIN="${1:-nvim}"

if ! command -v "$EDITOR_BIN" >/dev/null 2>&1; then
  echo "Error: $EDITOR_BIN not found in PATH" >&2
  exit 1
fi

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

STDERR_LOG="$TMP_DIR/stderr.log"
HEALTH_LOG="$TMP_DIR/health.log"

handle_smoke_failure() {
  echo "Smoke tests failed for $EDITOR_BIN" >&2
  [ -s "$STDERR_LOG" ] && cat "$STDERR_LOG" >&2
  exit 1
}

check_vim_errors() {
  if grep -E 'E[0-9]+:' "$STDERR_LOG" >/dev/null 2>&1; then
    echo "Vim error detected in stderr:" >&2
    grep -E 'E[0-9]+:' "$STDERR_LOG" >&2
    exit 1
  fi
}

EDITOR_NAME="$(basename "$EDITOR_BIN")"

case "$EDITOR_NAME" in
  nvim)
    echo "Running smoke tests with $EDITOR_BIN..."
    "$EDITOR_BIN" --headless -S test/smoke.vim 2>"$STDERR_LOG" || handle_smoke_failure
    check_vim_errors

    echo "Checking Neovim health..."
    TERM="xterm-256color" TMUX="" "$EDITOR_BIN" --headless -c "checkhealth" -c "w! $HEALTH_LOG" -c "qall!" >/dev/null 2>&1 || true
    if [ ! -s "$HEALTH_LOG" ]; then
      echo "checkhealth produced no output - health could not be verified" >&2
      exit 1
    fi
    if grep -E 'ERROR' "$HEALTH_LOG" >/dev/null 2>&1; then
      echo "Errors detected in :checkhealth output:" >&2
      grep -E 'ERROR' "$HEALTH_LOG" >&2
      exit 1
    fi
    ;;

  vim)
    echo "Running smoke tests with $EDITOR_BIN..."
    "$EDITOR_BIN" -Nu "$HOME/.vimrc" -es -S test/smoke.vim 2>"$STDERR_LOG" || handle_smoke_failure
    check_vim_errors
    ;;

  *)
    echo "Error: unsupported editor '$EDITOR_BIN'. Expected 'nvim' or 'vim'." >&2
    exit 1
    ;;
esac

echo "All tests passed for $EDITOR_BIN."
