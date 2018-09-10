" Treat Pathogen as a plugin and read from .vim/bundle/ instead of .vim/autoload/
runtime bundle/vim-pathogen/autoload/pathogen.vim

" Where all the shortcuts live
runtime! config/bindings.vim

" Let Pathogen manage plugins
execute pathogen#infect()

" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

" vim-colors-solarized
syntax enable
if has('gui_running')
  set transparency=3
  " fix js regex syntax
  set regexpengine=1
  syntax enable
endif
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
set guifont=Inconsolata:h15
set guioptions-=L

" vim-markdown
set conceallevel=2

" disable folding
let g:vim_markdown_folding_disabled = 1

" vim-javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Other {{{
vnoremap < <gv
vnoremap > >gv
" make Y consistent with C and D. See :help Y.
nnoremap Y y$
" Y in visual mode copies to system clipboard
vmap Y "+y
" }}}
