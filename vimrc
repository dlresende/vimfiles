" Treat Pathogen as a plugin and read from .vim/bundle/ instead of .vim/autoload/
runtime bundle/vim-pathogen/autoload/pathogen.vim

" Let Pathogen manage plugins
execute pathogen#infect()

runtime! config/bindings.vim  " Load shortcuts

silent Helptags    " generate :help docs for plugins installed with pathogen

set expandtab      " on pressing tab, insert 2 spaces
set tabstop=2      " show existing tab with 2 spaces width
set shiftwidth=2   " when indenting with '>', use 2 spaces width
set conceallevel=2 " concealed text is completely hidden

" vim-colors-solarized {{{
  syntax on
  set background=dark
  let g:solarized_termtrans=1
  let g:solarized_contrast='normal' " Use 'high' to toggle the presentation mode
  colorscheme solarized
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
  highlight SignColumn ctermbg=NONE " gutter to have same color as where the line numbers show up

  set signcolumn=yes

  let g:ale_linters_explicit = 1 " only run linters named in ale_linters settings
  let g:ale_warn_about_trailing_whitespace = 0 " handled by vim-better-whitespace
	let g:ale_change_sign_column_color = 0 " reset the sign column color when there are no more errors
  let g:ale_sign_column_always = 1 " can keep the sign gutter open at all times
  let g:ale_sign_error = '>>'
  let g:ale_sign_warning = '--'
  " let g:ale_sign_error = '☠︎'
  " let g:ale_sign_warning = '⚠'
  let g:ale_set_highlights = 1 " disable highlighting
  let g:airline#extensions#ale#enabled = 1 " show errors or warnings in my statusline
  let g:ale_lint_on_save = 1
  let g:ale_lint_on_text_changed = 'never' " 'never' or 'normal'
  let g:ale_lint_on_enter = 0 " if you don't want linters to run on opening a file
  let g:ale_list_window_size = 10 " height for the error list
" }}}
