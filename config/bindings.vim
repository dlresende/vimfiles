" this line MUST come before any <leader> mappings
let mapleader=","

" save by pressing <enter>
nnoremap <silent> <cr> :w<cr>

" move to previous buffer
nnoremap <silent> <leader>z :bp<CR>

" move to next buffer
nnoremap <silent> <leader>x :bn<CR>

" move to previous window
nmap <silent> <C-p> :wincmd p<CR>

" make windows the same size
nmap <silent> <leader>w= :wincmd =<CR>

" swap windows
nmap <silent> <leader>wx :wincmd x<CR>

" split window horizontally
nmap <silent> <leader>hs :split<CR>

" split window vertically
nmap <silent> <leader>vs :vsplit<CR>

" close window splitting
nmap <silent> <leader>sc :close<CR>

" disable highlight until next search
nnoremap <silent> <space> :noh<cr>

" decrease identation on Visual mode
vnoremap < <gv

" increase identation on Visual mode
vnoremap > >gv

" make Y consistent with C and D - see `:help Y`
nnoremap Y y$

" copy to system clipboard in Visual mode
vmap Y "+y
