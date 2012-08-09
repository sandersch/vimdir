"
" Commands
"

" View differences between the current buffer and the original file.
" (Based on code from $VIMRUNTIME/vimrc_example.vim.)
"
if !exists(":DiffOrig")
    command DiffOrig vertical new | set buftype=nofile | read # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" Close current buffer without closing window.
"
command! Bd enew<Bar>bd #
