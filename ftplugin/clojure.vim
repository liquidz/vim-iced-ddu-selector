if exists('g:loaded_vim_iced_ddu_selector')
  finish
endif

if empty(globpath(&rtp, 'autoload/ddu.vim'))
  echoe 'Shougo/ddu.vim is required.'
  finish
endif

if !exists('g:vim_iced_version')
     \ || g:vim_iced_version < 30801
  echoe 'iced-ddu-selector requires vim-iced v3.8.1 or later.'
  finish
endif

let g:loaded_vim_iced_ddu_selector = 1

let s:definition = {
      \ 'runtimepath':  'autoload/ddu.vim',
      \ 'run': {config -> iced#ddu#selector#start(config)},
      \ }

if !exists('g:iced#selector#external')
  let g:iced#selector#external = {}
endif

let g:iced#selector#external['ddu'] = {
      \ 'runtimepath':  'autoload/ddu.vim',
      \ 'run': {config -> iced#ddu#selector#start(config)},
      \ }
