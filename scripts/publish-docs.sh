#!/usr/bin/env bash

set -e # bail out early if any command fails
set -u # fail if we hit unset variables
set -o pipefail # fail if any component of any pipe fails

REPO_DIR="$(dirname "$0")"

make docs > wiki/Home.md
( cd wiki
  git add Home.md
  git commit -m "Update cheatsheet"
  git push
)
