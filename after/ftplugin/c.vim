" Vim filetype plugin modifications
" Language:	C

" Use single-line comments
setlocal commentstring=//%s

" " Do not indent case in switch
" setlocal cinoptions+=:0
" Do not overindent braces in case
setlocal cinoptions+=l1+2s
