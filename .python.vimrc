"=============================================================================
"    Description: Python用設定
"         Author: Shintaro Kurosawa
"  Last Modified: 2014-06-28 12:11
"        Version: 1.0
"=============================================================================
"----------------------------------------
" Description:
"    Modified:
"----------------------------------------

" indent
filetype plugin on
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

" Execute python script C-P 
function! s:ExecPy()
    exe "!" . &ft . " %"
:endfunction
command! Exec call <SID>ExecPy()
autocmd FileType python map <silent> <C-P> :call <SID>ExecPy()<CR>
