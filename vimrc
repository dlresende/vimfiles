" Treat Pathogen as a plugin and read from .vim/bundle/ instead of .vim/autoload/
runtime bundle/vim-pathogen/autoload/pathogen.vim

" Let Pathogen manage plugins
execute pathogen#infect()

runtime! config/bindings.vim  " Load shortcuts
runtime! config/lang/golang.vim
runtime! config/lang/java.vim

silent Helptags    " generate :help docs for plugins installed with pathogen

set expandtab      " on pressing tab, insert 2 spaces
set tabstop=2      " show existing tab with 2 spaces width
set shiftwidth=2   " when indenting with '>', use 2 spaces width
set conceallevel=2 " concealed text is completely hidden
set number         " show line number

autocmd BufRead,BufNewFile * setlocal signcolumn=yes " always keep signcolumn
autocmd BufRead,BufNewFile * highlight SignColumn ctermbg=NONE " configure gutter to have same color as where the line numbers show up

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


" ale {{{
	highlight ALESignColumnWithoutErrors ctermfg=246 ctermbg=7 guifg=#839496 guibg=Grey
  let g:ale_linters_explicit = 1 " only run linters named in ale_linters settings
  let g:ale_warn_about_trailing_whitespace = 0 " handled by vim-better-whitespace
	let g:ale_change_sign_column_color = 0 " reset the sign column color when there are no more errors
  let g:ale_sign_column_always = 1 " can keep the sign gutter open at all times
  let g:ale_sign_error = '☠︎'
  let g:ale_sign_warning = '⚠'
  let g:ale_set_highlights = 1 " disable highlighting
  let g:airline#extensions#ale#enabled = 1 " show errors or warnings in my statusline
  let g:ale_lint_on_save = 1
  let g:ale_lint_on_text_changed = 'never' " 'never' or 'normal'
  let g:ale_lint_on_enter = 0 " if you don't want linters to run on opening a file
  let g:ale_list_window_size = 10 " height for the error list
  let g:ale_linters = {
  \ 'yaml': [ 'yamllint'],
  \ 'sh':   [ 'shellcheck'],
  \ 'go':   [ 'gometalinter', 'gobuild'],
  \ 'java': [ 'javac', 'checkstyle', 'pmd'],
  \ 'ruby': [ 'ruby', 'rubocop', 'reek'],
  \}
  let g:ale_go_gometalinter_options = 
        \ '--vendor ' .
        \ '--fast ' .
        \ '--exclude=\"\bexported \\w+ (\\S*[''.]*)([a-zA-Z''.*]*) should have comment or be unexported\b\"'
  let g:ale_java_pmd_options = 'pmd -R category/java/bestpractices.xml' " pmd installed via brew has a different api: `pmd pmd -R...`
" }}}


" ctrl.vim {{{
" }}}
