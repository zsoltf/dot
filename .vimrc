" Zsolt's iPhone5 vimrc

filetype off
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let g:vundle_default_git_proto = 'git'

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'

syntax on
filetype plugin indent on

set t_Co=256

syntax enable
set background=dark
colorscheme desert

" Essentials
if filereadable(expand("~/.vim/vimrc"))
    source ~/.vim/vimrc
endif
