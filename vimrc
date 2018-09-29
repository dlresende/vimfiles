" Treat Pathogen as a plugin and read from .vim/bundle/ instead of .vim/autoload/
runtime bundle/vim-pathogen/autoload/pathogen.vim

" Let Pathogen manage plugins
execute pathogen#infect()

runtime! config/bindings.vim  " Load shortcuts

set expandtab      " on pressing tab, insert 2 spaces
set tabstop=2      " show existing tab with 2 spaces width
set shiftwidth=2   " when indenting with '>', use 2 spaces width
set conceallevel=2 " concealed text is completely hidden


" vim-colors-solarized {{{
  syntax enable
  set background=dark
  let g:solarized_contrast='normal' " Use 'high' to toggle the presentation mode
  colorscheme solarized
" }}}


" vim-markdown {{{
	let g:vim_markdown_no_default_key_mappings   = 1 " disable default key mappings
	let g:vim_markdown_folding_disabled          = 1 " disable the folding configuration
	let g:vim_markdown_folding_level             = 1 " Folding level is a number between 1 and 6
	let g:vim_markdown_folding_style_pythonic    = 0 " fold in a style like python-mode
	let g:vim_markdown_override_foldtext         = 1 " prevent foldtext from being set add
	let g:vim_markdown_toc_autofit               = 1 " Allow for the TOC window to auto-fit when it's possible for it to shrink
	let g:vim_markdown_conceal                   = 0 " disable conceal regardless of conceallevel setting
  let g:vim_markdown_folding_disabled          = 1 " disable folding
  let g:vim_markdown_edit_url_in               = 'current' " how to open new files ('tab', 'vsplit', 'hsplit', 'current')
  let g:vim_markdown_auto_insert_bullets       = 0 " Do not automatically insert bulletpoints
  let g:vim_markdown_new_list_item_indent      = 0 " set the new list item indent
  let g:vim_markdown_auto_extension_ext        = 'md' " Change default file extension
  let g:vim_markdown_autowrite                 = 0 " Auto-write when following link
  let g:vim_markdown_no_extensions_in_markdown = 0 " Do not require .md extensions for Markdown links
	let g:vim_markdown_follow_anchor             = 0 " allows the ge command to follow named anchors in links of the form file#anchor or just #anchor
	let g:vim_markdown_fenced_languages          = ['c++ = cpp', 'viml = vim', 'bash = sh', 'ini = dosini'] " use filetype name as fenced code block languages for syntax highlighting
	let g:vim_markdown_emphasis_multiline        = 0 " restrict text emphasis to a single line
" }}}


" vim-javacomplete2 {{{
  autocmd FileType java setlocal omnifunc=javacomplete#Complete

  let g:JavaComplete_MavenRepositoryDisable  = 0                " don't append classpath with libraries specified in pom.xml
  let g:JavaComplete_UseFQN                  = 0                " use full qualified name in completions description
  let g:JavaComplete_ClosingBrace            = 0                " add close brace automatically, when complete method declaration
  let g:JavaComplete_ImportDefault           = -1               " the default selection of import options
  let g:JavaComplete_StaticImportsAtTop      = 0                " imports sorting with static imports at the top
  let g:JavaComplete_ImportSortType          = 'packageName'    " imports sorting type be by jar archives 'jarName' or by package names 'packageName'
  let g:JavaComplete_AutoStartServer         = 1                " Disable automatic startup of server
  let g:JavaComplete_CompletionResultSort    = 1                " Sort completion results alphabetically
  let g:JavaComplete_CustomTemplateDirectory = '~/jc_templates' " set directory that contains custom templates, for class creation<Paste>
" }}}


" vim-airline {{{
  let g:airline#extensions#tabline#enabled   = 1 " displays all buffers when there's only one tab open
  let g:airline#extensions#tabline#formatter = 'default'
" }}}


" vim-better-whitespace {{{
  let g:better_whitespace_ctermcolor='red' " set a custom highlight color
  let g:better_whitespace_enabled=1 " enable highlighting
  let g:strip_whitespace_on_save = 0 " strip all trailing whitespace everytime you save the file
  let g:strip_whitelines_at_eof=0 " strip white lines at the end of the file when stripping whitespace
  let g:show_spaces_that_precede_tabs=0 " highlight space characters that appear before or in-between tabs
  let g:better_whitespace_skip_empty_lines=0 " ignore lines that contain only whitespace
" }}}


" vim-go {{{
  let g:go_fmt_command = "goimports" " goimports will format import declarations on save
  let g:go_textobj_include_function_doc = 1 " treat comments as part of a function (e.g. `vaf`)
  let g:go_fmt_fail_silently = 0 " do not show errors when parsing the file on save
  let g:go_addtags_transform = "camelcase" " case it should apply while converting: snake_case, snake_case
  let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck'] " tools used by gometalinter
  let g:go_metalinter_autosave = 1
  let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
  let g:go_metalinter_deadline = "5s"
  let g:go_def_mode = 'guru' " use 'guru' of 'godef' to go to definition
  let g:go_decls_includes = "func,type" " what :GoDecls and :GoDeclsDir should show
  let g:go_auto_type_info = 1 " automatically run :GoInfo whenever you move your cursor (default `set updatetime=800`)
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

" ale {{{
  let g:ale_linters_explicit = 1 " only run linters named in ale_linters settings
  let g:ale_warn_about_trailing_whitespace = 0 " handled by vim-better-whitespace
  let g:ale_sign_column_always = 1 " can keep the sign gutter open at all times
  let g:ale_sign_error = '>>'
  let g:ale_sign_warning = '--'
  let g:ale_set_highlights = 1 " disable highlighting
  let g:airline#extensions#ale#enabled = 1 " show errors or warnings in my statusline
  let g:ale_lint_on_save = 1
  let g:ale_lint_on_text_changed = 'never' " 'never' or 'normal'
  let g:ale_lint_on_enter = 0 " if you don't want linters to run on opening a file
  let g:ale_list_window_size = 10 " height for the error list
  let g:ale_linters = {
  \ 'yaml': ['yamllint'],
  \}
" }}}
