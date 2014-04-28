" Misc.
set nowrap
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
