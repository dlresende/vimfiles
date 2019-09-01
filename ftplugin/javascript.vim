" ale {{{
  let b:ale_linters = ['eslint']
" }}}

" Required for operations modifying multiple buffers like rename.
set hidden

let b:LanguageClient_autoStart = 1

let b:LanguageClient_serverCommands = {
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
