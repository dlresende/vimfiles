" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'iamcco/coc-diagnostic', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile', 'tag': '*'}
  Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}
  Plug 'fannheyward/coc-texlab', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile', 'branch': 'release'}
  Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile', 'tag': '*'}
  Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile', 'tag': '*'}
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install --frozen-lockfile'  }
  Plug 'preservim/nerdtree', { 'tag': '*' }
  Plug 'godlygeek/tabular'
  Plug 'preservim/tagbar'
  Plug 'vim-airline/vim-airline'
  Plug 'altercation/vim-colors-solarized'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive', { 'tag': '*' }
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround', { 'tag': '*' }
call plug#end()
