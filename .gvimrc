colorscheme molokai
set guifont=Osaka-Mono:h14
" set guifont=Ricty-Regular:h16

" Ctrl-x Ctrl-kではなく最初からCtrl-nで辞書から補完する
set complete+=k

set cursorline

" コマンドラインの高さ
set cmdheight=2

source $HOME/dotfiles/.gvimrc.system

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
 au BufNewFile,BufRead * match ZenkakuSpace /　/ 

"特殊文字(SpecialKey)の見える化。listcharsはlcsでも設定可能。
"trailは行末スペース。
set list
 set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:< 

