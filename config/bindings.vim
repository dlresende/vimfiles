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
  map \ :NERDTreeToggle<CR>
" }}}


" vim-javacomplete2 {{{
  " To enable smart (trying to guess import option) inserting class imports with F4, add:
  nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
  imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

  " To enable usual (will ask for import option) inserting class imports with F5, add:
  nmap <F5> <Plug>(JavaComplete-Imports-Add)
  imap <F5> <Plug>(JavaComplete-Imports-Add)

  " To add all missing imports with F6:
  nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
  imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

  " To remove all unused imports with F7:
  nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
  imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
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
