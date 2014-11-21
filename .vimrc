"=============================================================================
"    Description: .vimrc設定
"         Author: anonymous
"  Last Modified: 0000-00-00 07:03
"        Version: 0.00
"=============================================================================
set nocompatible
set encoding=utf-8
"scriptencoding cp932
scriptencoding unix
" scriptencodingと、このファイルのエンコーディングが一致するよう注意！
" scriptencodingは、vimの内部エンコーディングと同じものを推奨します。
" 改行コードは set fileformat=unix に設定するとunixでも使えます。

" Windowsで内部エンコーディングを cp932以外にしていて、
" 環境変数に日本語を含む値を設定したい場合は Let を使用します。
" Letは vimrc(オールインワンパッケージの場合)と encode.vim で定義されます。
" Let $HOGE=$USERPROFILE.'/ほげ'

"----------------------------------------
" ユーザーランタイムパス設定
"----------------------------------------
" Windows, unixでのruntimepathの違いを吸収するためのもの。
" $MY_VIMRUNTIMEはユーザーランタイムディレクトリを示す。
" :echo $MY_VIMRUNTIMEで実際のパスを確認できます。
if isdirectory($HOME . '/.vim')
  let $MY_VIMRUNTIME = $HOME.'/.vim'
elseif isdirectory($HOME . '\vimfiles')
  let $MY_VIMRUNTIME = $HOME.'\vimfiles'
elseif isdirectory($VIM . '\vimfiles')
  let $MY_VIMRUNTIME = $VIM.'\vimfiles'
endif

" ランタイムパスを通す必要のあるプラグインを使用する場合、
" $MY_VIMRUNTIMEを使用すると Windows/Linuxで切り分ける必要が無くなります。
" 例) vimfiles/qfixapp (Linuxでは~/.vim/qfixapp)にランタイムパスを通す場合
" set runtimepath+=$MY_VIMRUNTIME/qfixapp

"----------------------------------------
" 内部エンコーディング指定
"----------------------------------------
" 内部エンコーディングのUTF-8化と文字コードの自動認識設定をencode.vimで行う。
" オールインワンパッケージの場合 vimrcで設定されます。
" エンコーディング指定や文字コードの自動認識設定が適切に設定されている場合、
" 次行の encode.vim読込部分はコメントアウトして下さい。
" silent! source $MY_VIMRUNTIME/pluginjp/encode.vim
" scriptencodingと異なる内部エンコーディングに変更する場合、
" 変更後にもscriptencodingを指定しておくと問題が起きにくくなります。
" scriptencoding cp932


" 基本設定
" 環境や言語に依存しない共通事項を設定します

" vim-bootstrap
source $HOME/dotfiles/.vimrc.vim-bootstrap

" システム設定
source $HOME/dotfiles/.vimrc.system

" 各種スクリプトによる関数定義
" source $HOME/dotfiles/.vimrc.script.vimrcEx
" source $HOME/dotfiles/.vimrc.script.gcc

" 移動関連
source $HOME/dotfiles/.vimrc.moving

" インデント
 source $HOME/dotfiles/.vimrc.indent

" ファイル操作
source $HOME/dotfiles/.vimrc.file

" 表示設定
source $HOME/dotfiles/.vimrc.apperance

" 自動補完設定
source $HOME/dotfiles/.auto_completion.vimrc

" 検索設定
source $HOME/dotfiles/.vimrc.search

" ステータスライン
source $HOME/dotfiles/.vimrc.statusline

" タグ設定
source $HOME/dotfiles/.vimrc.tags

" diff設定
source $HOME/dotfiles/.vimrc.diff

" 辞書設定
source $HOME/dotfiles/.dictionary.vimrc

" 短縮入力設定
source $HOME/dotfiles/.vimrc.abbreviations

" シンタックスハイライト
source $HOME/dotfiles/.vimrc.syntax

" mac用設定
if has('mac')
  " source $HOME/dotfiles/.vimrc.mac
endif

" ローカル環境
source $HOME/dotfiles/.vimrc.local

" ファンクションキー設定
source $HOME/dotfiles/.functionkey.vimrc

" key map
source $HOME/dotfiles/.vimrc.keymap

" 勉強用
" source $HOME/dotfiles/.vimrc.practice

" プラグイン設定
source $HOME/dotfiles/.vimrc.plugin.neobundle
source $HOME/dotfiles/.plugin.neocomplete.vimrc
source $HOME/dotfiles/.vimrc.plugin.neosnippet
source $HOME/dotfiles/.plugin.jedi_vim.vimrc
source $HOME/dotfiles/.plugin.pymode.vimrc
source $HOME/dotfiles/.vimrc.plugin.vim-quickhl
source $HOME/dotfiles/.vimrc.plugin.unite-outline
source $HOME/dotfiles/.vimrc.plugin.vim-indent-guides
source $HOME/dotfiles/.vimrc.plugin.vim-airline

" let g:pymode_rope_complete_on_dot = 0
" set clipboard+=unnamed,autoselect

augroup cpp-namespace
    autocmd!
    autocmd FileType cpp inoremap <buffer><expr>; <SID>expand_namespace()
augroup END
function! s:expand_namespace()
    let s = getline('.')[0:col('.')-1]
    if s =~# '\<b;$'
        return "\<BS>oost::"
    elseif s =~# '\<s;$'
        return "\<BS>td::"
    elseif s =~# '\<d;$'
        return "\<BS>etail::"
    else
        return ';'
    endif
endfunction

augroup cpp-clangformat
    autocmd!
    autocmd FileType c,cpp,objc noremap <C-K> :pyf /path/to/clang-format.py<CR>
augroup END

imap <C-e>  <End>

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

" vimgrep関連を試しに追加する
" カーソル位置の単語でgrep
nnoremap <S-F12> :vimgrep /<C-R><C-W>/j **/* <CR>

" 現在開いているすべてのバッファからgrep
" 見えているバッファからgrepする場合は、bufdoの代わりにwindoを使う
" 実行するたびにQuickfixが追加されてしまうので、 cexpr "" を実行すること
nnoremap <S-F11> :bufdo vimgrepadd /<C-R><C-K>/j **/* %<CR>

" 検索結果の表示(他にも使いどころがある？)
nnoremap <F12> :copen <CR>

" 次の該当位置へジャンプ
nnoremap <F8> :cnext <CR>

" 前の該当位置へジャンプ
nnoremap <F7> :cprevious <CR>

" cwでQuickfixを開く
nmap <C-G> :vimgrep /<C-R><C-W>/j **/*

set textwidth=0

" 既定のvimgrepを内部grepにする
set grepprg=internal

" CUI上での色指定
colorscheme darkblue

" Quickfixを常に開く
autocmd QuickFixCmdPost *grep* cwindow

nmap <S-F5> :ls<CR>:buf


" for exjumplist
" nmap <C-M-i>  <Plug>(exjumplist-go-last)
" nmap <C-M-o>  <Plug>(exjumplist-go-first)
nmap <S-C-F8>  <Plug>(exjumplist-next-buffer)
nmap <S-C-F7>  <Plug>(exjumplist-previous-buffer)
