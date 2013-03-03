" Zsolt's iPad vimrc

" Plugins
if filereadable(expand("~/.vim/vimrc"))
    source ~/.vim/vimrc
endif

" Pathogen for iPad
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
syntax on
filetype plugin indent on

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
"set background=dark
"colorscheme solarized
" ------------------------------------------------------------------

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_termtrans=0
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
" let g:solarized_termcolors=256
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
" let g:solarized_diffmode="normal"
" let g:solarized_hitrail=0
" let g:solarized_menu=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


