#!/usr/bin/env bash

set -e
set -u
set -o pipefail

for bin in vim nvim shellcheck python3; do
  if ! command -v "$bin" >/dev/null 2>&1; then
    echo "Error: $bin not found in PATH" >&2
    exit 1
  fi
done

echo "Checking Vim script syntax..."
vim_files=()
[ -f "vimrc" ] && vim_files+=("vimrc")
while IFS= read -r file; do
  [ -n "$file" ] && vim_files+=("$file")
done < <(find config ftplugin -type f -name '*.vim' | sort)

has_error=0
for file in "${vim_files[@]}"; do
  out=$(vim -Nu NONE -i NONE -es \
    -c "set nocompatible" \
    -c "try | source $file | catch | put =v:throwpoint | put =v:exception | 1delete | %print | cq! 1 | endtry" \
    -c "qa!" 2>&1)
  ret=$?
  if [ $ret -ne 0 ]; then
    echo "Syntax error in $file:" >&2
    echo "$out" >&2
    has_error=1
  fi
done

if [ $has_error -ne 0 ]; then
  exit 1
fi

echo "Running shellcheck..."
shellcheck install scripts/*.sh

echo "Checking coc-settings.json..."
python3 -m json.tool coc-settings.json >/dev/null

echo "All lint checks passed."
