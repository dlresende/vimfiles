" ale {{{
  let b:ale_ruby_solargraph_executable = 'solargraph'
  let b:ale_ruby_solargraph_options = {
    \ 'completion': 'true',
    \ 'hover': 'true',
    \ 'symbols': 'true',
    \ 'definitions': 'true',
    \ 'rename': 'true',
    \ 'references': 'true',
    \ 'autoformat': 'false',
    \ 'diagnostics': 'true',
    \ 'formatting': 'false',
    \ 'folding': 'false',
    \ 'logLevel': 'warn',
    \ }

  let b:ale_linters = { 'ruby': [ 'solargraph' ] }
" }}}

set foldmethod=syntax
