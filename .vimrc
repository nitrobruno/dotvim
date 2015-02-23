" pathogen configuration
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Misc.
syntax on
filetype plugin indent on
set modeline
set modelines=1
set nowrap
set linebreak
set colorcolumn=+1
set mouse=a
set tabstop=8 softtabstop=0 shiftwidth=4 expandtab
set noequalalways
let mapleader=","
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

" Easy .vimrc modification
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Quick spell check toggles
nnoremap <silent> <leader>s :set spell!<CR>
nnoremap <silent> <leader>sen :set spell spelllang=en<CR>
nnoremap <silent> <leader>sfr :set spell spelllang=fr<CR>

" netrw plugin configuration
let g:netrw_preview=1
let g:netrw_sort_options="i"

" vim-colors-solarized plugin configuration
if has('gui_running')
    set background=dark
    let g:solarized_menu=0
    let g:solarized_italic=0
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
            \ 'file': '\v\.(o|d|elf|map)$' ,
            \ }
let g:ctrlp_root_markers = ['.top']
let g:ctrlp_match_window = 'results:100'
