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

" Split window horizontally
nmap <silent> <leader>hs :split<CR>

" Split window vertically
nmap <silent> <leader>vs :vsplit<CR>

" Close window splitting
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
