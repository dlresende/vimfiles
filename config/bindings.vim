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


" tabularize {{{
  nmap <leader>t= :Tabularize /=<CR>
  vmap <leader>t= :Tabularize /=<CR>
  nmap <leader>t: :Tabularize /:\zs<CR>
  vmap <leader>t: :Tabularize /:\zs<CR>
" }}}


" ctrlp.vim {{{
  nnoremap <leader>f :CtrlPCurWD<cr>
" }}}
