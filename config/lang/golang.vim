" vim-go {{{
  let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment'] " Control syntax-based folding which takes effect when 'foldmethod' is set to `syntax`
  let g:go_fmt_command = "goimports" " goimports will format import declarations on save
  let g:go_textobj_include_function_doc = 1 " treat comments as part of a function (e.g. `vaf`)
  let g:go_fmt_autosave = 0
  let g:go_fmt_fail_silently = 0 " do not show errors when parsing the file on save
  let g:go_addtags_transform = "camelcase" " case it should apply while converting: snake_case, snake_case
  let g:go_metalinter_autosave = 0 " delegate checks to ale
  let g:go_metalinter_autosave_enabled = []
  let g:go_metalinter_enabled = [] " tools used by gometalinter
  let g:go_metalinter_deadline = "5s"
  let g:go_def_mode = 'guru' " use 'guru' or 'godef' to go to definition
  let g:go_decls_includes = "func,type" " what :GoDecls and :GoDeclsDir should show
  let g:go_auto_type_info = 0 " automatically run :GoInfo whenever you move your cursor (default `set updatetime=800`)
  let g:go_auto_sameids = 0 " automatically run :GoSameIds

  " Enable extended highlighting
  let g:go_highlight_types = 0
  let g:go_highlight_fields = 0
  let g:go_highlight_functions = 0
  let g:go_highlight_function_calls = 0
  let g:go_highlight_operators = 0
  let g:go_highlight_extra_types = 0
  let g:go_highlight_build_constraints = 0
  let g:go_highlight_generate_tags = 0
" }}}

augroup dlresende_golang
  autocmd!
  autocmd BufRead * normal zR " Unfold all when opening a new file
  autocmd FileType go setlocal foldmethod=syntax
augroup END
