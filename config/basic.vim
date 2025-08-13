syntax on

set background=dark
set conceallevel=2  " concealed text is completely hidden
set expandtab       " on pressing tab, insert 2 spaces
set nofixendofline  " Preserve missing newline at end of file
set shiftwidth=2    " when indenting with '>', use 2 spaces width
set tabstop=2       " show existing tab with 2 spaces width

if has('nvim')
  " Live substitution
  set inccommand=nosplit
endif
