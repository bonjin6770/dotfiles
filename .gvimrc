colorscheme molokai

" Ctrl-x Ctrl-kではなく最初からCtrl-nで辞書から補完する
set complete+=k

set cursorline

" コマンドラインの高さ
set cmdheight=2

source $HOME/dotfiles/.gvimrc.system
source $HOME/dotfiles/.gvimrc.font

"全角スペースを視覚化
" highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
highlight ZenkakuSpace cterm=underline ctermfg=lightblue
 au BufNewFile,BufRead * match ZenkakuSpace /　/

"特殊文字(SpecialKey)の見える化。listcharsはlcsでも設定可能。
"trailは行末スペース。
set list
 set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<

if has('mac')
  set imdisable
endif

" 横スクロールバー表示
set guioptions+=b
