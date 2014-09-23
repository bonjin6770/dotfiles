"=============================================================================
"    Description: auto-completion
"                 自動補完設定
"         Author: Shintaro Kurosawa
"  Last Modified: 2014-05-12 17:40
"        Version: 1.0
"=============================================================================

" brackets
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>
" vnoremap { "zdi{z}
" vnoremap {" "zdi{"z"}
" vnoremap {' "zdi{'z'}
" vnoremap [ "zdi[z]
" vnoremap [" "zdi["z"]
" vnoremap [' "zdi['z']
" vnoremap ( "zdi(z)
" vnoremap (" "zdi("z")
" vnoremap (' "zdi('z')
" vnoremap " "zdi"z"
" vnoremap ' "zdi'z''"

" C言語のコメント
inoremap /* /*  */<LEFT><LEFT><LEFT>
