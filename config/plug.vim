" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'fannheyward/coc-pyright', {'do': 'NODE_OPTIONS=--no-deprecation yarn --silent --frozen-lockfile --ignore-peer-deps --ignore-engines install --frozen-lockfile '}
  Plug 'godlygeek/tabular'
  Plug 'iamcco/coc-diagnostic', {'do': 'NODE_OPTIONS=--no-deprecation yarn --silent --frozen-lockfile --ignore-peer-deps --ignore-engines install --frozen-lockfile '}
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
  Plug 'lifepillar/vim-solarized8'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'neoclide/coc.nvim', {'do': 'NODE_OPTIONS=--no-deprecation yarn --silent --frozen-lockfile --ignore-peer-deps --ignore-engines install --frozen-lockfile ', 'branch': 'release'}
  Plug 'neoclide/coc-java', {'do': 'NODE_OPTIONS=--no-deprecation yarn --silent --frozen-lockfile --ignore-peer-deps --ignore-engines install --frozen-lockfile '}
  Plug 'neoclide/coc-json', {'do': 'NODE_OPTIONS=--no-deprecation yarn --silent --frozen-lockfile --ignore-peer-deps --ignore-engines install --frozen-lockfile ', 'tag': '*'}
  Plug 'neoclide/coc-solargraph', {'do': 'NODE_OPTIONS=--no-deprecation yarn --silent --frozen-lockfile --ignore-peer-deps --ignore-engines install --frozen-lockfile ', 'tag': '*'}
  Plug 'neoclide/coc-tsserver', {'do': 'NODE_OPTIONS=--no-deprecation yarn --silent --frozen-lockfile --ignore-peer-deps --ignore-engines install --frozen-lockfile ', 'tag': '*'}
  Plug 'preservim/nerdtree', { 'tag': '*' }
  Plug 'preservim/vim-markdown'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive', { 'tag': '*' }
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround', { 'tag': '*' }
  Plug 'vim-airline/vim-airline'
call plug#end()
