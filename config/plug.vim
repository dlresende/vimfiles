" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'altercation/vim-colors-solarized'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}
  Plug 'godlygeek/tabular'
  Plug 'iamcco/coc-diagnostic', {'do': 'yarn install --frozen-lockfile'}
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile', 'tag': '*'}
  Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile', 'tag': '*'}
  Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile', 'tag': '*'}
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile', 'branch': 'release'}
  Plug 'preservim/nerdtree', { 'tag': '*' }
  Plug 'preservim/vim-markdown'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive', { 'tag': '*' }
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround', { 'tag': '*' }
  Plug 'vim-airline/vim-airline'
call plug#end()
