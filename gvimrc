" .gvimrc
"
" GUI-only Vim settings.
"

set guioptions+=b           " Activate the bottom horizontal scrollbar
set guioptions-=T           " Turn off the toolbar

set guicursor=a:blinkon0    " Turn off cursor blink in all modes

set guitablabel=%t\ %m      " GUI tab labels show filename and modified flag
set guitabtooltip=%F        " GUI tab tooltips show the full pathname

set showtabline=2           " Always show the tab line
set tabpagemax=100          " Allow many more files to be opened in tabs

" Avoid all beeping and flashing by turning on the visual bell, and then
" setting the visual bell to nothing.
"
" Note: Even if t_vb is set in vimrc, it has to be set again here, as it's
" reset when the GUI starts.
"
set vb t_vb=
