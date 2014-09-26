"=============================================================================
"    Description: Windows用設定
"         Author: Shintaro Kurosawa
"  Last Modified: 2014-05-15 09:08
"        Version: 2.0
"=============================================================================
"----------------------------------------
" Description:
"    Modified:
"----------------------------------------
"----------------------------------------
" 2013/12/19 追加
" ファンクションキーの設定
"----------------------------------------
" ヘルプ検索
" nnoremap <F1> K
nnoremap <F5> :Gcc<CR>
nnoremap <F6> :source $HOME/.vimrc<CR>:source $HOME/.gvimrc<CR>
nnoremap <F7> :tabprevious<CR>
nnoremap <F8> :tabnext<CR>
" 現在開いているvimスクリプトファイルを実行
nnoremap <F9> :source %<CR>
nnoremap <F10> :Unite outline<CR>
