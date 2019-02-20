" vim-javacomplete2 {{{
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

augroup vimfiles_java
  autocmd!
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup END
