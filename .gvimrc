colorscheme molokai

" Ctrl-x Ctrl-kではなく最初からCtrl-nで辞書から補完する
set complete+=k

set cursorline

" コマンドラインの高さ
set cmdheight=2

" カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,h,l,[,],<,>

" 削除でレジスタに格納しない(ビジュアルモードでの選択後は格納する)
" nnoremap x "_x
" nnoremap dd "_dd

" ===================================================================
" フォント設定:
" ===================================================================
if has('win32')
  " Windows用
  " set guifont=MS_Gothic:h10:cSHIFTJIS
  set guifont=MyricaM_M:h14:cANSI
  "set guifont=MS_Mincho:h12:cSHIFTJIS
  " set guifont=Consolas:h11:cSHIFTJIS
  " 行間隔の設定
  " set linespace=1
  " 一部のUCS文字の幅を自動計測して決める
  if has('kaoriya')
    " set ambiwidth=auto
  endif
elseif has('gui_macvim')
  " set guifont=Osaka-Mono:h16
  " set guifont=Osaka-Mono:h14
  set guifont=Ricty:h14
elseif has('mac')
  " set guifont=Osaka－等幅:h16
  " set guifont=Ricty Regular:h16
elseif has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
  set guifont=Ricty Regular:h16
endif

"全角スペースを視覚化
" highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
highlight ZenkakuSpace cterm=underline ctermfg=lightblue
 au BufNewFile,BufRead * match ZenkakuSpace /　/

"特殊文字(SpecialKey)の見える化。listcharsはlcsでも設定可能。
"trailは行末スペース。
set list
 set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<

if has('mac')
  " set imdisable
endif

" 横スクロールバー表示
set guioptions+=b
