" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

runtime! config/bindings.vim  " Load shortcuts

set expandtab      " on pressing tab, insert 2 spaces
set tabstop=2      " show existing tab with 2 spaces width
set shiftwidth=2   " when indenting with '>', use 2 spaces width
set conceallevel=2 " concealed text is completely hidden

call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
  Plug 'kien/ctrlp.vim'
  Plug 'preservim/nerdtree'
  Plug 'majutsushi/tagbar'
  Plug 'vim-airline/vim-airline'
  Plug 'altercation/vim-colors-solarized'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
call plug#end()

" vim-colors-solarized {{{
  syntax on
  set background=dark
  let g:solarized_termtrans=1
  let g:solarized_contrast='normal' " Use 'high' to toggle the presentation mode
  colorscheme solarized
" }}}


" vim-airline {{{
  let g:airline#extensions#tabline#enabled   = 1 " displays all buffers when there's only one tab open
  let g:airline#extensions#tabline#formatter = 'default'
" }}}


" vim-better-whitespace {{{
  let g:better_whitespace_ctermcolor='red' " set a custom highlight color
  let g:better_whitespace_enabled=1 " enable highlighting
  let g:strip_whitespace_on_save = 0 " strip all trailing whitespace everytime you save the file
  let g:strip_whitelines_at_eof=0 " strip white lines at the end of the file when stripping whitespace
  let g:show_spaces_that_precede_tabs=0 " highlight space characters that appear before or in-between tabs
  let g:better_whitespace_skip_empty_lines=0 " ignore lines that contain only whitespace
" }}}
