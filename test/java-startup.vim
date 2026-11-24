let s:started = reltime()
let s:services = []

function! s:CheckJava(timer) abort
  try
    if get(g:, 'coc_service_initialized', 0)
      let s:services = CocAction('services')
      for service in s:services
        if service.id ==# 'java' && service.state ==# 'running'
          echomsg 'Java language server initialized successfully.'
          qall!
        endif
        if service.id ==# 'java' && service.state ==# 'startFailed'
          throw 'Java language server failed to initialize.'
        endif
      endfor
    endif
    if reltimefloat(reltime(s:started)) > 180
      throw 'Timed out waiting for Java initialization. Services: ' . string(s:services)
    endif
  catch
    echohl ErrorMsg
    echomsg v:exception
    echohl None
    cquit!
  endtry
endfunction

call timer_start(200, function('s:CheckJava'), {'repeat': -1})
