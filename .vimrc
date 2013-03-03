"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Vimrc essentials
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set t_vb=
set autoread                    "Reload files changed outside vim
set hidden

set wildmenu
set wildmode=list:longest,full

" Highlight problematic whitespace"
set list
set listchars=trail:.,extends:#,nbsp:.

" Color
set background=dark
"colorscheme ir_black
colorscheme desert
syntax on
filetype plugin indent on

" Search Settings
set incsearch
set hlsearch
set viminfo='100,f1

" Backup Files
set noswapfile
set nobackup
set nowb
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

""set shortmess+=filmnrxoOtT
""set ignorecase
""set smartcase
""set wildmenu
""set wildmode=list:longest,full
""set whichwrap=b,s,h,l,<,>,[,]
""set scrolljump=5
""set scrolloff=3
""set foldenable
""set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
                                " Selected characters/lines in visual mode
endif

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    "set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Aliases
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader= '<SPACE>'

set pastetoggle=<F12>

" Easier moving in tabs and windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocmd and Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set completefunc=syntaxcomplete#Complete
autocmd FileType python set completefunc=pythoncomplete#Complete

" Remove trailing whitespaces and ^M chars
autocmd FileType * autocmd BufWritePre <buffer> call StripTrailingWhitespace()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Strip whitespace
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Additional Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Platform Specific Options
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" Plugins
if filereadable(expand("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
endif
