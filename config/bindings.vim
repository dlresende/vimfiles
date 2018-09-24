" This line MUST come before any <leader> mappings
let mapleader=","

" Save by pressing <enter>
nnoremap <silent> <cr> :w<cr>

" Move back and forth through previous and next buffers with ,z and ,x
nnoremap <silent> <leader>z :bp<CR>
nnoremap <silent> <leader>x :bn<CR>

" Window Movement
" Previous Window
nmap <silent> <C-p> :wincmd p<CR>
" Equal Size Windows
nmap <silent> <leader>w= :wincmd =<CR>
" Swap Windows
nmap <silent> <leader>wx :wincmd x<CR>

" Window Splitting
nmap <silent> <leader>hs :split<CR>
nmap <silent> <leader>vs :vsplit<CR>
nmap <silent> <leader>sc :close<CR>

" Disable highlight until next search
nnoremap <silent> <space> :noh<cr>

" Make line completion easier
imap <C-l> <C-x><C-o>

vnoremap < <gv
vnoremap > >gv
" make Y consistent with C and D. See :help Y.
nnoremap Y y$
" Y in visual mode copies to system clipboard
vmap Y "+y


" nerdtree {{{
  map \       :NERDTreeToggle<CR>
	nnoremap \| :NERDTreeFind<CR>
" }}}


" vim-javacomplete2 {{{
  nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
  nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
  nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
  nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

  imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
  imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
  imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
  imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

  nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

  imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

  nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
  nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
  nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
  nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
  nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
  nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
  nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
  nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

  imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
  imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
  imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

  vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
  vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
  vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

  nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
  nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)
" }}}


" vim-multiple-cursors {{{
  let g:multi_cursor_use_default_mapping =  0       " Disable default mappings
  let g:multi_cursor_start_word_key      = '<C-n>'
  let g:multi_cursor_select_all_word_key = '<A-n>'
  let g:multi_cursor_start_key           = 'g<C-n>'
  let g:multi_cursor_select_all_key      = 'g<A-n>'
  let g:multi_cursor_next_key            = '<C-n>'
  let g:multi_cursor_prev_key            = '<C-p>'
  let g:multi_cursor_skip_key            = '<C-x>'
  let g:multi_cursor_quit_key            = '<Esc>'
" }}}


" tagbar {{{
  nmap <F8> :TagbarToggle<CR>
" }}}


" vim-better-whitespace {{{
  nmap <leader>s :StripWhitespace<CR>
  nmap <leader><space> :ToggleWhitespace<CR>
  nnoremap ]w :NextTrailingWhitespace<CR>
  nnoremap [w :PrevTrailingWhitespace<CR>
" }}}


" vim-markdown {{{
  map ]] <Plug>Markdown_MoveToNextHeader
  map [[ <Plug>Markdown_MoveToPreviousHeader
  map ][ <Plug>Markdown_MoveToNextSiblingHeader
  map [] <Plug>Markdown_MoveToPreviousSiblingHeader
  map ]u <Plug>Markdown_MoveToParentHeader
  map ]c <Plug>Markdown_MoveToCurHeader
  map gx <Plug>Markdown_OpenUrlUnderCursor
  map ge <Plug>Markdown_EditUrlUnderCursor
" }}}


" tabularize {{{
  nmap <leader>t= :Tabularize /=<CR>
  vmap <leader>t= :Tabularize /=<CR>
  nmap <leader>t: :Tabularize /:\zs<CR>
  vmap <leader>t: :Tabularize /:\zs<CR>
" }}}
