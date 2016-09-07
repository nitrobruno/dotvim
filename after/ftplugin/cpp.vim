" Vim filetype plugin modifications
" Language:	C++

" Use single-line comments
setlocal commentstring=//%s

" Do not indent scope declarations
setlocal cino+=g0

" Do not indent inside namespace
setlocal cino+=N-s
