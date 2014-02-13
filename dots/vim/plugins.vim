"
" PLUGIN SETTINGS
" ===============

"
" CtrlP Settings
"
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"
" NERDTree
"
let g:NERDSpaceDelims=1
let NERDTreeIgnore=['\.vim$', '\.pyc$', '\~$']

"
" Git Gutter
"
let g:gitgutter_enabled = 1
let g:gitgutter_sign_column_always = 1
let g:gitgutter_eager = 0

"
" Airline
"
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''

let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]
let g:airline#extensions#whitespace#trailing_format = 'trailing[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mixed-indent[%s]'

"
" Others
"
let g:vim_json_syntax_conceal = 0
let g:virtualenv_auto_activate = 1
