let s:save_cpo = &cpoptions
set cpoptions&vim

function! iced#ddu#selector#start(config) abort
  let candidates = get(a:config, 'candidates', [])
  let Callback = get(a:config, 'accept', '')
  if type(Callback) != v:t_func
    return
  endif

  let id = denops#callback#register({s -> Callback('', s)}, {'once': v:true})
  call ddu#start({'sources': [{'name': 'custom-list', 'params': {'texts': candidates, 'callbackId': id}}]})
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo

