" Turn off any vi compatibility
set nocompatible
set shortmess+=I        " Don't show the Vim welcome screen
let mapleader=","       " Set this early in case other things use it

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"Enable syntax highlightning and some nice filetype associations
syntax enable
filetype plugin indent on
colorscheme gummybears

" Set console highlights to be readable with black background
set bg=dark

" Make GUI colors light on dark
hi Normal guibg=black guifg=white

" Make pasting work much better
nmap <silent> <S-Insert> :set paste<CR>"+p:set nopaste<CR>

set autoindent          " Copy indent from current line for new line
set nosmartindent       " 'smartindent' breaks right-shifting of # lines

set history=500         " Remember this many commands

set number              " Display line numbers
set numberwidth=4       " Minimum number of columns to show for line numbers
set ruler               " Always show the cursor position
set showmode            " Always show the mode
set showcmd             " Display incomplete commands
set incsearch           " Do incremental searching (as you type)
set hlsearch            " Highlight the latest search pattern
set laststatus=2        " Always show a status line

set splitright          " Split new vertical windows right of current window
set splitbelow          " Split new horizontal windows under the current window

set winminheight=0      " Allow windows to shrink to status line.
set winminwidth=0       " Allow windows to shrink to vertical separator.

set lbr                 " Wrap line on word boundaries
set wrap

set expandtab           " Insert spaces for <Tab> press; use spaces to indent.
set smarttab            " Tab respects 'shiftwidth', 'tabstop', 'softtabstop'.
set tabstop=4           " Set the visible width of tabs.
set softtabstop=4       " Edit as if tabs are 4 characters wide.
set shiftwidth=4        " Number of spaces to use for indent and unindent.
set shiftround          " Round indent to a multiple of 'shiftwidth'.
set showcmd             " Letting me know I'm in 'leader' mode

set wildmode=list:longest,full
set wildmenu

set virtualedit=block

" Care about case only if I use an uppercase letter
set ignorecase
set smartcase

" Set visual bell to nothing
set vb
set t_vb=

" Use - to jump between windows
map - <c-w>w

" Make buffers less annoying, i.e., 
" keep changed buffers without requiring saves
set hidden

" Act more 'normal' about backpacking
" e.g. to backspace past start of edit
set backspace=indent,eol,start

" Make the keyboard and mouse act more like Windows
set selection=exclusive
set selectmode=mouse,key
set mousemodel=popup
set keymodel=startsel,stopsel

set whichwrap+=<,>,[,]

set listchars=tab:>-,trail:·
set list

" Update the swap file every 20 characters. I don't like to lose stuff.
"
set updatecount=20

" Source other settings from files
"
"

" Load custom file type extensions
source $HOME/.vim/myfiletypes.vim

" Load platform specific settings
source $HOME/.vim/platform_setup.vim

"
" Key Mappings
"

" Backspace in Visual mode deletes selection.
"
vnoremap <BS> d

" Control+A is Select All.
"
noremap  <C-A>  gggH<C-O>G
inoremap <C-A>  <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A>  <C-C>gggH<C-O>G
onoremap <C-A>  <C-C>gggH<C-O>G
snoremap <C-A>  <C-C>gggH<C-O>G
xnoremap <C-A>  <C-C>ggVG

" Control+S saves the current file (if it's been changed).
"
noremap  <C-S>  :update<CR>
vnoremap <C-S>  <C-C>:update<CR>
inoremap <C-S>  <C-O>:update<CR>

" Control+Z is Undo, in Normal and Insert mode.
"
noremap  <C-Z>  u
inoremap <C-Z>  <C-O>u

" Control+Y is Redo (but not repeat) in Normal and Insert mode.
"
noremap  <C-Y>  <C-R>
inoremap <C-Y>  <C-O><C-R>

" F2 inserts the date and time at the cursor.
"
inoremap <F2>   <C-R>=strftime("%c")<CR>
nmap     <F2>   a<F2><Esc>

" F7 formats the current/highlighted paragraph.
"
" XXX: Consider changing this to gwap to maintain logical cursor position.
"
nnoremap <F7>   gqap
inoremap <F7>   <C-O>gqap
vnoremap <F7>   gq

" Shift+F7 joins all lines of the current paragraph or highlighted block
" into a single line.
"
nnoremap <S-F7>  vipJ
inoremap <S-F7>  <Esc>vipJi
vnoremap <S-F7>  J

" Tab/Shift+Tab indent/unindent the highlighted block (and maintain the
" highlight after changing the indentation). Works for both Visual and Select
" modes.
"
vmap >    >gv
vmap <  <gv

" Draw lines of dashes or equal signs below us based on the length of the current line 
"
"   yy      Yank whole line
"   p       Put line below current line
"   ^       Move to beginning of line
"   v$      Visually highlight to end of line
"   r-      Replace highlighted portion with dashes / equal signs
"   j       Move down one line
"   a       Return to Insert mode
"
" XXX: Convert this to a function and make the symbol a parameter.
" XXX: Consider making abbreviations/mappings for ---<CR> and ===<CR>
"
inoremap <C-U>- <Esc>yyp^v$r-ja
inoremap <C-U>= <Esc>yyp^v$r=ja

" Control+Hyphen (yes, I know it says underscore) repeats the character above
" the cursor.
"
inoremap <C-_>  <C-Y>

" Center the display line after searches. (This makes it *much* easier to see
" the matched line.)
"
" More info: http://www.vim.org/tips/tip.php?tip_id=528
"
nnoremap n   nzz
nnoremap N   Nzz
nnoremap *   *zz
nnoremap #   #zz
nnoremap g*  g*zz
nnoremap g#  g#zz

" Make page-forward and page-backward work in insert mode.
"
imap <C-F>  <C-O><C-F>
imap <C-B>  <C-O><C-B>

" Q formats the current/highlighted paragraph.
nnoremap Q  gwap
xnoremap Q  gw
vnoremap Q  gw

" Make page-forward and page-backward work in insert mode.
"
inoremap <C-F>  <C-O><C-F>
inoremap <C-B>  <C-O><C-B>

" Turn On/Off NERDTree
map <leader>n :NERDTreeToggle<CR>

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

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-k> [egv
vmap <C-j> ]egv
