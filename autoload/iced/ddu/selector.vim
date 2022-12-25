let s:save_cpo = &cpoptions
set cpoptions&vim

let g:iced#ddu#selector#ddu_options = get(g:, 'iced#ddu#selector#ddu_options', {})

function! iced#ddu#selector#start(config) abort
  let candidates = get(a:config, 'candidates', [])
  let Callback = get(a:config, 'accept', '')
  if type(Callback) != v:t_func
    return
  endif

  let id = denops#callback#register({s -> Callback('', s)}, {'once': v:true})
  let options = copy(g:iced#ddu#selector#ddu_options)
  call extend(options, {
        \ 'sources': [{'name': 'custom-list', 'params': {'texts': candidates, 'callbackId': id}}],
        \ })
  silent call ddu#start(options)
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo

