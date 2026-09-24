" Smoke tests for vimfiles configuration

function! s:assert(condition, message) abort
  if !a:condition
    let v:errors = get(v:, 'errors', [])
    call add(v:errors, 'ASSERTION FAILED: ' . a:message)
  endif
endfunction

" 1. Leader key
call s:assert(exists('g:mapleader') && g:mapleader ==# ',', 'g:mapleader should be ","')

" 2. Expected plugins in &runtimepath
let s:expected_plugins = [
      \ 'ctrlp.vim',
      \ 'nerdtree',
      \ 'vim-fugitive',
      \ 'vim-airline',
      \ 'vim-surround',
      \ 'coc.nvim'
      \ ]

for s:plugin in s:expected_plugins
  call s:assert(&runtimepath =~# s:plugin, 'Plugin missing from runtimepath: ' . s:plugin)
endfor

" 3. Commands exist
call s:assert(exists(':NERDTree') == 2, 'Command :NERDTree should exist')
call s:assert(exists(':CtrlP') == 2, 'Command :CtrlP should exist')

" 4. Mappings
call s:assert(maparg(',f', 'n') !=# '', 'Mapping for ,f (CtrlP) should exist in normal mode')

" Report errors and exit
if exists('v:errors') && len(v:errors) > 0
  for s:err in v:errors
    echohl ErrorMsg
    echomsg s:err
    echohl None
  endfor
  cquit!
endif

qall!
