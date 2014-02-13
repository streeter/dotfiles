

"
" MOVEMENT
" ========

" page down with <Space>
nmap <Space> <PageDown>

" Move vertically by visual line. If there is a very long line that gets
" visually wrapped, j won't skip over the fake part of the visual line, in
" favor of the next real line
nnoremap j gj
nnoremap k gk

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


"
" LEADER SHORTCUTS
" ================

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" Open ag.vim
nnoremap <leader>a :Ag

" CtrlP
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
map <C-t> :CtrlP<CR>

" NERDTree
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
map <C-d> :NERDTreeToggle<CR>

" Tagbar
nmap <leader>] :TagbarToggle<CR>
map <C-]> :TagbarToggle<CR>

" GitGutter
nmap <leader>g :GitGutterToggle<CR>

" Whitespace
nmap <leader><space> :call whitespace#strip_trailing()<CR>

" Others
nmap <leader>a :Ack<space>
nmap <leader>c <Plug>Kwbd
map <leader>l :Align

" in case you forgot to sudo
cmap w!! %!sudo tee > /dev/null %


