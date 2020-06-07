#!/usr/bin/env bash

[ -z "$DEBUG" ] || set -x

set -e # bail out early if any command fails
set -u # fail if we hit unset variables
set -o pipefail # fail if any component of any pipe fails

WIKI_REPO="$(mktemp -d)"

git clone git@github.com:dlresende/vimfiles.wiki.git "$WIKI_REPO"

make docs > "$WIKI_REPO/Home.md"

( cd "$WIKI_REPO"
  git commit -m "Update cheatsheet" -- Home.md || true
  git push origin master || true
)
