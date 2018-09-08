" Treat Pathogen as a plugin and read from .vim/bundle/ instead of .vim/autoload/
runtime bundle/vim-pathogen/autoload/pathogen.vim

" Let Pathogen manage plugins
execute pathogen#infect()

" Turn on color syntax highlighting
syntax on

" Enable loading the plugin files for specific file types
filetype plugin indent on

" NERDTree shortcuts
map \ :NERDTreeToggle<CR>
