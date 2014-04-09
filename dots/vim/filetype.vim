"
" Filetype detection
"
augroup filetypedetect
    " Detect .txt as 'text'
    autocmd! BufNewFile,BufRead *.txt setfiletype text

    autocmd BufRead,BufNewFile *.ipy set filetype=python
augroup END
