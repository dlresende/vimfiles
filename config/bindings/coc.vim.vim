" go to definition
nmap <silent> gd <Plug>(coc-definition)

" go to type defitinion
nmap <silent> gy <Plug>(coc-type-definition)

" go to implementation
nmap <silent> gi <Plug>(coc-implementation)

" find references
nmap <silent> gr <Plug>(coc-references)

" show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Apply codeAction to the selected region. Example: `<leader>aap` for current paragraph.
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Apply codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)

" apply AutoFix to problem on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" select inside function/method
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)

" select around function/method
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)

" select inside class/struct/interface
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)

" select around class/struct/interface
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" select next selection range
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" select previous selection range
xmap <silent> <C-d> <Plug>(coc-range-select-backward)

" add `:Format` command to format current buffer
command! -nargs=0 Format :call CocAction('format')

" add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

" manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>

" show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>

" find symbol of current document (outline)
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>

" search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>

" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

" Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
