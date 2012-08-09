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
nmap <silent> <S-Insert> :set paste<CR>"*p:set nopaste<CR>

set autoindent          " Copy indent from current line for new line
set nosmartindent       " 'smartindent' breaks right-shifting of # lines

set history=10000       " Remember this many commands

set number              " Display line numbers
set numberwidth=4       " Minimum number of columns to show for line numbers
set ruler               " Always show the cursor position
set showmode            " Always show the mode
set showcmd             " Display incomplete commands
set incsearch           " Do incremental searching (as you type)
set hlsearch            " Highlight the latest search pattern
set laststatus=2        " Always show a status line

set splitright          " Split new vertical windows right of current window

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

" Load key mappings
source $HOME/.vim/key_maps.vim

" Load commands
source $HOME/.vim/commands.vim
