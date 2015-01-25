"=============================================================================
"    Description: neocomplete
"         Author:
"  Last Modified: 2014-06-28
"        Version: 1.0
"=============================================================================
"----------------------------------------
" Description:
"    Modified:
"----------------------------------------

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" 2015/1/25 macvimのimeの挙動がおかしいため、一時コメントアウト
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return neocomplete#close_popup() . "\<CR>"
"   For no inserting <CR> key.
"  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
" endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'



"----------------------------------------
" 以下、macvim対策で設定しなおした。
" 整理する必要あり。
"----------------------------------------
let g:neocomplete#force_overwrite_completefunc = 1

" vim起動と同時に起動する
let g:neocomplete#enable_at_startup = 1

" 自動で補完候補を出さない
if has('gui_macvim')
  let g:neocomplete#disable_auto_complete = 1
endif

" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1

" camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplete#enable_camel_case_completion = 1

" _(アンダーバー)区切りの補完を有効化
let g:neocomplete#enable_underbar_completion = 1

" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplete#min_syntax_length = 3

" メニューの一番目を自動選択
let g:neocomplete#enable_auto_select = 1
"
" neocompleteを自動的にロックするバッファ名のパターン
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" <Ctrl+Space> ：手動補完候補表示
" pumvisibleは、neocompleteの補完メニューが出ているかどうかを判定してくれます
" inoremap <expr><nul> pumvisible() ? "\<down>" : neocomplete#start_manual_complete()

" 補完をキャンセルしてカーソル移動(ここらへんはご自由に！)
inoremap <expr><left> neocomplete#cancel_popup() . "\<left>"
inoremap <expr><right> neocomplete#cancel_popup() . "\<right>"

" 日本語入力時、無効化
" let g:neocomplete#lock_iminsert = 1

" 補完開始文字数
let g:neocomplete#auto_completion_start_length = 3

" TABで補完できるようにする
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" 補完を選択しpopupを閉じる
" inoremap <expr><C-y> neocomplete#close_popup()
"
" 補完をキャンセルしpopupを閉じる
" inoremap <expr><C-e> neocomplete#cancel_popup()

" TABで補完できるようにする
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" undo
inoremap <expr><C-g>     neocomplete#undo_completion()

" 補完候補の共通部分までを補完する
inoremap <expr><C-s> neocomplete#complete_common_string()

" C-nでneocomplete補完
" inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"

" C-pでkeyword補完
" inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"

" 補完候補が出ていたら確定、なければ改行
inoremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : "<CR>"
