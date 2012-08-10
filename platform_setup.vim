" Set 'selection', 'selectmode', 'mousemodel' and 'keymodel' to make
" both keyboard- and mouse-based highlighting behave more like Windows
" and OS X. (These are the same settings you get with `:behave mswin`.)
"
" Note: 'selectmode', 'keymodel', and 'selection' are also set within
" map_movement_keys.vim, since they're critical to the behavior of those
" mappings (although they should be set to the same values there as here.)
"
" Note: Under MacVim, `:let macvim_hig_shift_movement = 1` will cause MacVim
" to set selectmode and keymodel. See `:help macvim-shift-movement` for
" details.
" 
set selectmode=mouse,key
set keymodel=startsel,stopsel
set selection=exclusive
set mousemodel=popup

" These settings are taken from the $VIMRUNTIME/mswin.vim file, which is
" normally used to make Vim behave more like a native MS-Windows
" application. I don't source that file any longer, but I still want
" some of the mappings when running in Windows. (Mappings that I always
" want, regardless of platform, are below this conditional.)
"
if has("win32")

    " CTRL-X and SHIFT-Del are Cut
    vnoremap <C-X>      "+x
    vnoremap <S-Del>    "+x

    " CTRL-C and CTRL-Insert are Copy
    vnoremap <C-C>      "+y
    vnoremap <C-Insert> "+y

    " CTRL-V and SHIFT-Insert are Paste
    map <C-V>           "+gP
    map <S-Insert>      "+gP

    cmap <C-V>          <C-R>+
    cmap <S-Insert>     <C-R>+

    " Pasting blockwise and linewise selections is not possible in Insert and
    " Visual mode without the +virtualedit feature.  They are pasted as if
    " they were characterwise instead. Uses the paste.vim autoload script.
    "
    "exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
    "exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

    imap <S-Insert>     <C-V>
    vmap <S-Insert>     <C-V>

    " For CTRL-V to work autoselect must be off.
    " On Unix we have two selections, autoselect can be used.
    "
    if !has("unix")
        set guioptions-=a
    endif

    " Use CTRL-Q to do what CTRL-V used to do
    "
    noremap <C-Q>       <C-V>

    " CTRL-F4 is Close window
    "
    noremap  <C-F4>     <C-W>c
    inoremap <C-F4>     <C-O><C-W>c
    cnoremap <C-F4>     <C-C><C-W>c
    onoremap <C-F4>     <C-C><C-W>c

    " Control+Tab moves to the next window.
    "
    noremap  <C-Tab>    <C-W>w
    inoremap <C-Tab>    <C-O><C-W>w
    cnoremap <C-Tab>    <C-C><C-W>w
    onoremap <C-Tab>    <C-C><C-W>w

    " Alt-Space is System menu
    "
    if has("gui")
        noremap  <M-Space> :simalt ~<CR>
        inoremap <M-Space> <C-O>:simalt ~<CR>
        cnoremap <M-Space> <C-C>:simalt ~<CR>
    endif

    " Other settings I find useful on Windows
    set grepprg=internal        " Windows findstr.exe just isn't good enough.
endif " has("win32")

" Prepend OS-appropriate temporary directories to the backupdir list.
"
if has("unix") " (including OS X)

    " Remove the current directory from the backup directory list.
    "
    set backupdir-=.

    " Save backup files in the current user's ~/tmp directory, or in the
    " system /tmp directory if that's not possible.
    "
    set backupdir^=~/tmp,/tmp

    " Try to put swap files in ~/tmp (using the munged full pathname of
    " the file to ensure uniqueness). Use the same directory as the
    " current file if ~/tmp isn't available.
    "
    set directory=~/tmp/,/var/tmp/.

elseif has("win32")

    " Remove the current directory from the backup directory list.
    "
    set backupdir-=.

    " Save backup files in the current user's TEMP directory
    " (that is, whatever the TEMP environment variable is set to).
    "
    set backupdir^=$TEMP

    " Put swap files in TEMP, too.
    "
    set directory=$TEMP\\\\

endif

" For tmux (and probably screen)
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
