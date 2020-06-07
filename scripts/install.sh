#!/usr/bin/env bash

[ -z "$DEBUG" ] || set -x

set -e # bail out early if any command fails
set -u # fail if we hit unset variables
set -o pipefail # fail if any component of any pipe fails

if [[ ! -d "$HOME/.vim" ]] ; then
  git clone https://github.com/dlresende/vimfiles.git ~/.vim
fi

( cd "$HOME/.vim" || exit 1
  git pull
  make install
)

