set background=dark
colorscheme ir_black

set nocompatible

set list
set listchars=trail:.,extends:#,nbsp:. " Highlight problematic whitespace
set nowrap
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabseop=4
set showmode
set laststatus=2
set shortmess+=filmnrxoOtT
set backspace=indent,eol,start
set linespace=0                 
set nu                          
set showmatch                   
set incsearch                   
set hlsearch                    
set winminheight=0              
set ignorecase                  
set smartcase                   
set wildmenu                    
set wildmode=list:longest,full  
set whichwrap=b,s,h,l,<,>,[,]   
set scrolljump=5                
set scrolloff=3                 
set foldenable                  
set pastetoggle=<F12>           
"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks

let mapleader= '<SPACE>'

" Easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Shh
set vb
set t_vb=

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set completefunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

set cfu=syntaxcomplete#Complete

source .vimrc.plugins
filetype plugin indent on
syntax enable

"source .vimrc.local
