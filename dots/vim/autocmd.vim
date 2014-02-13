" Automatically reload vimrc when it's saved
autocmd! BufWritePost .vimrc so ~/.vimrc
autocmd! BufWritePost vimrc so ~/.vimrc


" Go back to the position the cursor was on the last time this file was edited
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif


"
" Autogroups
"
augroup configgroup
    " Clear all current autocmd's for the current group
    autocmd!

    autocmd! BufRead,BufNewFile Gemfile,Rakefile,Procfile,Guardfile,Brewfile,Podfile setf ruby

    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2

    autocmd FileType crontab setl backupcopy=yes
    autocmd BufEnter /tmp/crontab.* setl backupcopy=yes

    " md is markdown
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    " json is json
    autocmd BufRead,BufNewFile *.json set filetype=json
    " fdoc is yaml
    autocmd BufRead,BufNewFile *.fdoc set filetype=yaml

augroup END

" Resize splits on window resize
autocmd VimResized * exe "normal! \<c-w>="

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Markdown
augroup markdown
    autocmd!
    autocmd Syntax markdown setlocal textwidth=79
    if exists("&colorcolumn")
        autocmd Syntax markdown setlocal colorcolumn=80
    endif
augroup END
