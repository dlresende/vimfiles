" Treat Pathogen as a plugin and read from .vim/bundle/ instead of .vim/autoload/
runtime bundle/vim-pathogen/autoload/pathogen.vim

" Let Pathogen manage plugins
execute pathogen#infect()

runtime! config/bindings.vim  " Load shortcuts

set tabstop=2     " show existing tab with 2 spaces width
set shiftwidth=2  " when indenting with '>', use 2 spaces width
set expandtab     " on pressing tab, insert 2 spaces

""" vim-colors-solarized
""" https://github.com/altercation/solarized/tree/master/vim-colors-solarized
syntax enable
set background=dark
let g:solarized_contrast="normal" " Use 'high' to toggle the presentation mode
colorscheme solarized

""" vim-markdown
""" https://github.com/plasticboy/vim-markdown#basic-usage
set conceallevel=2                      " concealed text is completely hidden
let g:vim_markdown_folding_disabled = 1 " disable folding

""" vim-javacomplete2
""" https://github.com/artur-shaik/vim-javacomplete2#configuration
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Other {{{
vnoremap < <gv
vnoremap > >gv
" make Y consistent with C and D. See :help Y.
nnoremap Y y$
" Y in visual mode copies to system clipboard
vmap Y "+y
" }}}
