" This line MUST come before any <leader> mappings
let mapleader=","

" Save by pressing <enter>
nnoremap <silent> <cr> :w<cr>

" Move to previous buffer
nnoremap <silent> <leader>z :bp<CR>

" Move to next buffer
nnoremap <silent> <leader>x :bn<CR>

" Move to previous window
nmap <silent> <C-p> :wincmd p<CR>

" Make windows the same size
nmap <silent> <leader>w= :wincmd =<CR>

" Swap windows
nmap <silent> <leader>wx :wincmd x<CR>

" Split window horizontally
nmap <silent> <leader>hs :split<CR>

" Split window vertically
nmap <silent> <leader>vs :vsplit<CR>

" Close window splitting
nmap <silent> <leader>sc :close<CR>

" Disable highlight until next search
nnoremap <silent> <space> :noh<cr>

" Decrease identation on Visual mode
vnoremap < <gv

" Increase identation on Visual mode
vnoremap > >gv

" Make Y consistent with C and D. See :help Y.
nnoremap Y y$

" Copy to system clipboard in Visual mode
vmap Y "+y
