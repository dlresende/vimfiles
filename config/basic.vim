syntax on

set background=dark
set expandtab      " on pressing tab, insert 2 spaces
set tabstop=2      " show existing tab with 2 spaces width
set shiftwidth=2   " when indenting with '>', use 2 spaces width
set conceallevel=2 " concealed text is completely hidden

if has('nvim')
  " Live substitution
  set inccommand=nosplit
endif
