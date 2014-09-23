"=============================================================================
"    Description: 
"         Author: Shintaro Kurosawa
"  Last Modified: 2014-05-08 09:08
"        Version: 1.0
"=============================================================================
"----------------------------------------
" Description:
"    Modified:
"----------------------------------------

" neocompleteと連携
autocmd FileType python setlocal omnifunc=jedi#completions

let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
