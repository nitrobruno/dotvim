" pathogen configuration
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Misc.
syntax on
filetype plugin indent on
set nowrap
set linebreak
set mouse=a
set tabstop=8 softtabstop=0 shiftwidth=4 expandtab
if has('gui_running')
    set guioptions-=mrLtT " Default: aegimrLtT
endif

if has('unix')
    " Linux specific configuration
else
    " Windows specific configuration
    set encoding=utf-8
    if has('gui_running')
        set guifont=Liberation_Mono:h10
    endif
endif

" vim-colors-solarized plugin configuration
if has('gui_running')
    set background=dark
    let g:solarized_menu=0
    colorscheme solarized
    call togglebg#map("<F5>")
else
    " " To make it work in gnome-terminal, use:
    " " https://github.com/sigurdga/gnome-terminal-colors-solarized.git
    " set background=dark
    " colorscheme solarized
endif

" vim-session plugin configuration
let g:session_autosave='yes'
let g:session_autoload='no'

" tagbar plugin configuration
let g:tagbar_autoclose=1
nnoremap <silent> <C-L> :TagbarToggle<CR>

" surround plugin configuration
let g:surround_{char2nr('/')} = "/* \r */"

" control-p plugin configuration
let g:ctrlp_open_new_file = 'h'
let g:ctrlp_custom_ignore = {
            \ 'file': '\v\.o$' ,
            \ }

