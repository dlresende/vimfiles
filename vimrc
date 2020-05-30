" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

runtime! config/bindings.vim  " Load shortcuts

set expandtab      " on pressing tab, insert 2 spaces
set tabstop=2      " show existing tab with 2 spaces width
set shiftwidth=2   " when indenting with '>', use 2 spaces width
set conceallevel=2 " concealed text is completely hidden

call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'kien/ctrlp.vim'
  Plug 'preservim/nerdtree'
  Plug 'majutsushi/tagbar'
  Plug 'vim-airline/vim-airline'
  Plug 'altercation/vim-colors-solarized'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
call plug#end()

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


" coc.vim {{{
  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings using CoCList:
  " Show all diagnostics.
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}
