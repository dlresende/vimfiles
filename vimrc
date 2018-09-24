" Treat Pathogen as a plugin and read from .vim/bundle/ instead of .vim/autoload/
runtime bundle/vim-pathogen/autoload/pathogen.vim

" Let Pathogen manage plugins
execute pathogen#infect()

runtime! config/bindings.vim  " Load shortcuts

set tabstop=2     " show existing tab with 2 spaces width
set shiftwidth=2  " when indenting with '>', use 2 spaces width
set expandtab     " on pressing tab, insert 2 spaces


" vim-colors-solarized {{{
  syntax enable
  set background=dark
  let g:solarized_contrast="normal" " Use 'high' to toggle the presentation mode
  colorscheme solarized
" }}}


" vim-markdown
  set conceallevel=2                      " concealed text is completely hidden
  let g:vim_markdown_folding_disabled = 1 " disable folding
" }}}


" vim-javacomplete2
  autocmd FileType java setlocal omnifunc=javacomplete#Complete

  let g:JavaComplete_MavenRepositoryDisable = 0 " don't append classpath with libraries specified in pom.xml
  let g:JavaComplete_UseFQN = 0 " use full qualified name in completions description
  let g:JavaComplete_ClosingBrace = 0 " add close brace automatically, when complete method declaration
  let g:JavaComplete_ImportDefault = -1 " the default selection of import options
  let g:JavaComplete_StaticImportsAtTop = 0 " imports sorting with static imports at the top
  let g:JavaComplete_ImportSortType = 'packageName' " imports sorting type be by jar archives 'jarName' or by package names 'packageName'
  let g:JavaComplete_AutoStartServer = 1 " Disable automatic startup of server
  let g:JavaComplete_CompletionResultSort = 1 " Sort completion results alphabetically
  let g:JavaComplete_CustomTemplateDirectory = '~/jc_templates' " set directory that contains custom templates, for class creation<Paste>
" }}}


" vim-airline
  let g:airline#extensions#tabline#enabled = 1 " displays all buffers when there's only one tab open
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
