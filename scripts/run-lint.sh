#!/usr/bin/env bash

set -e
set -u
set -o pipefail

for bin in vint shellcheck python3; do
  if ! command -v "$bin" >/dev/null 2>&1; then
    echo "Error: $bin not found in PATH" >&2
    exit 1
  fi
done

echo "Running vint..."
PYTHONWARNINGS=ignore vint vimrc config/ ftplugin/ test/

echo "Running shellcheck..."
shellcheck install scripts/*.sh

echo "Checking coc-settings.json..."
python3 -m json.tool coc-settings.json >/dev/null

echo "All lint checks passed."
