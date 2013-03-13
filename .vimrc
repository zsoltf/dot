" Essentials
if filereadable(expand("~/.vim/vimrc"))
    source ~/.vim/vimrc
endif

" Plugins
if filereadable(expand("~/.vim/vimrc.plugins.ios"))
    source ~/.vim/vimrc.plugins.ios
endif
