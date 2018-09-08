" Treat Pathogen as a plugin and read from .vim/bundle/ instead of .vim/autoload/
runtime bundle/vim-pathogen/autoload/pathogen.vim

" Let Pathogen manage plugins
execute pathogen#infect()

" Enable loading the plugin files for specific file types
filetype plugin indent on

" NERDTree shortcuts
map \ :NERDTreeToggle<CR>

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
