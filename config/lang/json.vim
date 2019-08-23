augroup vimfiles_json
  autocmd!
  autocmd BufRead * normal zR " Unfold all when opening a new file
  autocmd FileType json setlocal foldmethod=syntax
augroup END
