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
set noequalalways " Do not resize windows automatically
set guioptions-=mrLtT " Default: aegimrLtT

let mapleader=","

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
nnoremap <leader>lv :source $MYVIMRC<CR>

" Change to the directory of the currently open file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Quick spell check toggles
nnoremap <silent> <leader>s :set spell!<CR>
nnoremap <silent> <leader>sen :set spell spelllang=en<CR>
nnoremap <silent> <leader>sfr :set spell spelllang=fr<CR>

" netrw plugin configuration
let g:netrw_preview=1
let g:netrw_sort_options="i"

" lightline plugin configuration
let g:lightline = {
        \ 'colorscheme' : 'solarized',
        \ 'active': {
        \     'left': [ 
        \         [ 'mode', 'paste' ],
        \         [ 'fugitive', 'readonly', 'relativepath', 'modified' ],
        \         [ 'ctrlpmark']
        \     ],
        \     'right': [
        \         [ 'lineinfo' ],
        \         [ 'percent' ],
        \         [ 'fileformat', 'fileencoding', 'filetype' ]
        \     ]
        \ },
        \ 'inactive': {
        \     'left': [ [ 'relativepath', 'modified'  ] ],
        \     'right': [ [ 'lineinfo' ], [ 'percent' ] ]
        \ },
        \ 'component_function': {
        \     'readonly': 'MyReadonly',
        \     'filename': 'MyFilename',
        \     'modified': 'MyModified',
        \     'fileformat': 'MyFileformat',
        \     'filetype': 'MyFiletype',
        \     'fileencoding': 'MyFileencoding',
        \     'mode': 'MyMode',
        \     'ctrlpmark': 'CtrlPMark',
        \     'fugitive': 'LightLineFugitive'
        \ }
\ }

function! MyModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! MyReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "RO"
    else
        return ""
    endif
endfunction

function MyFilename()
    let fname = expand('%:t')
    return fname == 'ControlP' ? g:lightline.ctrlp_item :
                \ fname == '__Tagbar__' ? g:lightline.fname :
                \ ('' != fname ? fname : '[No Name]')
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP' :
                \  winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
    if expand('%:t') =~ 'ControlP'
        call lightline#link('iR'[g:lightline.ctrlp_regex])
        return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                    \ , g:lightline.ctrlp_next], 0)
    else
        return ''
    endif
endfunction

let g:ctrlp_status_func = {
            \ 'main': 'CtrlPStatusFunc_1',
            \ 'prog': 'CtrlPStatusFunc_2',
            \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
    let g:lightline.ctrlp_regex = a:regex
    let g:lightline.ctrlp_prev = a:prev
    let g:lightline.ctrlp_item = a:item
    let g:lightline.ctrlp_next = a:next
    return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
    return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
    return lightline#statusline(0)
endfunction

function! LightLineFugitive()
    let max_size=16
    let branch=exists('*fugitive#head') ? fugitive#head() : ''
    return strchars(branch) > max_size ? substitute(branch, '.\{16\}\zs.*','…','') : branch
    " return exists('*fugitive#head') ? fugitive#head() : ''
    return branch
endfunction

" solarized plugin configuration
set background=dark
colorscheme solarized
if has('gui_running')
    let g:solarized_menu=0
    let g:solarized_italic=0
    call togglebg#map("<F5>")
endif

" session plugin configuration
set sessionoptions-=help
let g:session_autosave='yes'
let g:session_autoload='no'
let g:session_persist_colors=0

" tagbar plugin configuration
let g:tagbar_autoclose=1
nnoremap <silent> <C-L> :TagbarToggle<CR>

" surround plugin configuration
let g:surround_{char2nr('/')} = "/* \r */"

" control-p plugin configuration
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_open_new_file = 'h'
let g:ctrlp_custom_ignore = {
            \ 'file': '\v\.(o|d|elf|map)$' ,
            \ }
let g:ctrlp_root_markers = ['.top']
let g:ctrlp_match_window = 'results:100'

" fugitive plugin configuration
let g:fugitive_git_executable = 'LANGUAGE=en_US.UTF-8 git'
