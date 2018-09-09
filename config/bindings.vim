" Note: This line MUST come before any <leader> mappings
let mapleader=","

" NERDTree shortcuts
map \ :NERDTreeToggle<CR>

" Save by pressing <enter>
nnoremap <silent> <cr> :w<cr>

" Make line completion easier
imap <C-l> <C-x><C-o>

"Move back and forth through previous and next buffers with ,z and ,x
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

" vim-javacomplete2
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
