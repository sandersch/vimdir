" Associate file extension with type
"
augroup filetype
    au!
    au! BufRead,BufNewFile *.lic    set filetype=ruby
augroup END

" Use two space indenting for some file types
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2
