#!/usr/bin/env bash

[ -z "$DEBUG" ] || set -x

set -e # bail out early if any command fails
set -u # fail if we hit unset variables
set -o pipefail # fail if any component of any pipe fails

REPO_DIR="$(cd $(dirname "$0") && pwd)/.."

( cd "$REPO_DIR"
  make docs > wiki/Home.md

  ( cd wiki
    git add Home.md
    git commit -m "Update cheatsheet"
    git pull --rebase
  )

  git commit -m "Update wiki" -- wiki
)
