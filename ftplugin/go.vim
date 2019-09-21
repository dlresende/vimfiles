" ale {{{
  let b:ale_linters = {
  \ 'go': [ 'gopls' ],
  \}
" }}}

set foldmethod=syntax
" augroup vimfiles_golang
"   autocmd!
"   " autocmd BufRead * normal zR " Unfold all when opening a new file
"   autocmd FileType go setlocal foldmethod=syntax
" augroup END
