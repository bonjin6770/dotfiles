"=============================================================================
"    Description: .vimrc
"         Author: bonjin6770(twitter:bonjin6770)
"=============================================================================

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" 初期化
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
set nocompatible
set encoding=utf-8
scriptencoding unix
"----------------------------------------
" 初期化 > ユーザーランタイムパス設定
"----------------------------------------
if isdirectory($HOME . '/.vim')
  let $MY_VIMRUNTIME = $HOME.'/.vim'
elseif isdirectory($HOME . '\vimfiles')
  let $MY_VIMRUNTIME = $HOME.'\vimfiles'
elseif isdirectory($VIM . '\vimfiles')
  let $MY_VIMRUNTIME = $VIM.'\vimfiles'
endif

"----------------------------------------
" 初期化 > 内部エンコーディング指定
"----------------------------------------
silent! source $MY_VIMRUNTIME/pluginjp/encode.vim

" vim-bootstrap
source $HOME/dotfiles/.vimrc.vim-bootstrap

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" システム設定
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

"----------------------------------------
" システム設定 > バックアップファイル
"----------------------------------------
" ファイルの上書きの前にバックアップを作る/作らない
" set writebackupを指定してもオプション 'backup' がオンでない限り、
" バックアップは上書きに成功した後に削除される。
set nowritebackup
" バックアップ/スワップファイルを作成する/しない
set nobackup
set noswapfile

"----------------------------------------
" システム設定 > アンドゥ
"----------------------------------------
if version >= 703
  " 再読込、vim終了後も継続するアンドゥ(7.3)
  set undofile
  " アンドゥの保存場所(7.3)
  set undodir=.
endif

"----------------------------------------
" システム設定 > viminfo
"----------------------------------------
" viminfoを作成しない
set viminfo=

"----------------------------------------
" システム設定 > クリップボード
"----------------------------------------
" クリップボードを共有
set clipboard+=unnamed,autoselect

"----------------------------------------
" システム設定 > バッファ
"----------------------------------------
" 編集結果非保存のバッファから、新しいバッファを開くときに警告を出さない
set hidden

"----------------------------------------
" システム設定 > その他
"----------------------------------------
" 8進数を無効にする。<C-a>,<C-x>に影響する
set nrformats-=octal
" キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeout timeoutlen=3000 ttimeoutlen=100
" ヒストリの保存数
set history=50
" 日本語の行の連結時には空白を入力しない
set formatoptions+=mM
" コマンドライン補完するときに強化されたものを使う
set wildmenu
" マウスを有効にする
if has('mouse')
  set mouse=a
endif
" pluginを使用可能にする
filetype plugin indent on

" close winodw with save
noremap <leader>x :w<CR>
noremap <leader>X :wq<CR>

" close Window
noremap <leader>z :q<CR>
noremap <leader>Z :q!<CR>

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" カーソル移動
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
"----------------------------------------
" カーソル移動 > カーソル位置の単語をyankする
"----------------------------------------
nnoremap vy vawy
"----------------------------------------
" カーソル移動 > Visual blockモードでフリーカーソルを有効にする
"----------------------------------------
set virtualedit+=block
"----------------------------------------
" カーソル移動 > ビジュアルモード時vで行末まで選択
"----------------------------------------
vnoremap v $h
"----------------------------------------
" カーソル移動 > カーソルキーで行末／行頭の移動可能に設定
"----------------------------------------
set whichwrap=b,s,h,l,[,],<,>
"----------------------------------------
" カーソル移動 >  バックスペースでインデントや改行を削除できるようにする
"----------------------------------------
set backspace=indent,eol,start
"----------------------------------------
" カーソル移動 >  □や○の文字があってもカーソル位置がずれないようにする
"----------------------------------------
set ambiwidth=double

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" インデント
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
set autoindent   " 自動でインデント
"set paste        " ペースト時にautoindentを無効に(onにするとautocomplpop.vimが動かない)
set smartindent  " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent      " Cプログラムファイルの自動インデントを始める

" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=4 shiftwidth=4 softtabstop=0

if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on
  " これらのftではインデントを無効に
  "autocmd FileType php filetype indent off

  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType pascal     setlocal sw=2 sts=0 ts=2 et
endif

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" 履歴管理
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
"----------------------------------------
" 履歴管理 > 編集履歴を保存して終了する
"----------------------------------------
if has('persistent_undo')
    if ! isdirectory($HOME.'/.vim/undo')
        call mkdir($HOME.'/.vim/undo', 'p')
    endif
    set undodir=~/.vim/undo
    set undofile
endif

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" 表示設定
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

set showmatch         " 括弧の対応をハイライト
set number            " 行番号表示
set list              " 不可視文字表示
" set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
" デフォルト不可視文字は美しくないのでUnicodeで綺麗に
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set display=uhex      " 印字不可能文字を16進数で表示
" カーソル行をハイライト
set cursorline

" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

" スプラッシュ(起動時のメッセージ)を表示しない
" set shortmess+=I
" エラー時の音とビジュアルベルの抑制(gvimは.gvimrcで設定)
set noerrorbells
set novisualbell
set visualbell t_vb=
" マクロ実行中などの画面再描画を行わない
set lazyredraw
" Windowsでディレクトリパスの区切り文字表示に / を使えるようにする
set shellslash

" 行番号表示
set number
" 括弧の対応表示時間
set showmatch matchtime=1
" タブを設定
" set ts=4 sw=4 sts=4
" Cインデントの設定
set cinoptions+=:0
" タイトルを表示
set title
" コマンドラインの高さ (gvimはgvimrcで指定)
" set cmdheight=2
set laststatus=2
" コマンドをステータス行に表示
set showcmd
" 画面最後の行をできる限り表示する
set display=lastline
" Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:^\ ,trail:~

" ハイライトを有効にする
if &t_Co > 2 || has('gui_running')
  syntax on
endif

" 色テーマ設定
" gvimの色テーマは.gvimrcで指定する
colorscheme darkblue

"----------------------------------------
" 表示設定 > 全角スペースを表示
"----------------------------------------
function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

" コメント以外で全角スペースを指定しているので、scriptencodingと、
" このファイルのエンコードが一致するよう注意！
" 強調表示されない場合、ここでscriptencodingを指定するとうまくいく事があります。
" scriptencoding cp932
function! ZenkakuSpace()
  silent! let hi = s:GetHighlight('ZenkakuSpace')
  if hi =~ 'E411' || hi =~ 'cleared$'
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
  endif
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

set nowrap                " 長いテキストの折り返し無効

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" 自動補完設定
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" 検索設定
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" 検索の時に大文字小文字を区別しない
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別する
set smartcase
" 検索時にファイルの最後まで行ったら最初に戻る
set wrapscan
" インクリメンタルサーチ
set incsearch
" 検索文字の強調表示
set hlsearch
" w,bの移動で認識する文字
" set iskeyword=a-z,A-Z,48-57,_,.,-,>
" vimgrep をデフォルトのgrepとする場合internal
" set grepprg=internal

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" ステータスライン
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
set laststatus=2 " 常にステータスラインを表示

" カーソルが何行目の馴れ爪に置かれているかを表示する
set ruler

"ステータスラインに文字コードと改行文字を表示する
" if winwidth(0) >= 120
  " set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %{g:HahHah()}\ %F%=[%{GetB()}]\ %{fugitive#statusline()}\ %l,%c%V%8P
" else
  " set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %{g:HahHah()}\ %f%=[%{GetB()}]\ %{fugitive#statusline()}\ %l,%c%V%8P
" endif

"----------------------------------------
" 挿入モード時、ステータスラインのカラー変更
"----------------------------------------
" augroup InsertHook
" autocmd!
" autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340 ctermfg=cyan
" autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=white
" augroup END
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

"----------------------------------------
" ステータスラインに文字コード等表示
" iconvが使用可能の場合、カーソル上の文字コードをエンコードに応じた表示にするFencB()を使用
"----------------------------------------
if has('iconv')
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=[0x%{FencB()}]\ (%v,%l)/%L%8P\
else
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\
endif

" FencB() : カーソル上の文字コードをエンコードに応じた表示にする
function! FencB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return s:Byte2hex(s:Str2byte(c))
endfunction

function! s:Str2byte(str)
  return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction

function! s:Byte2hex(bytes)
  return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
endfunction

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif
" if has('unix') && !has('gui_running')
"   " ESCですぐに反映されない対策
"   inoremap <silent> <ESC> <ESC>
" endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
    redraw
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" タグ設定
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
source $HOME/dotfiles/.vimrc.tags

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" diff設定
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
source $HOME/dotfiles/.vimrc.diff

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" 辞書設定
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
source $HOME/dotfiles/.dictionary.vimrc

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" 短縮入力設定
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
source $HOME/dotfiles/.vimrc.abbreviations

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" シンタックスハイライト
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
source $HOME/dotfiles/.vimrc.syntax

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" プラグイン設定
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
source $HOME/dotfiles/.vimrc.plugin.neobundle
source $HOME/dotfiles/.plugin.neocomplete.vimrc
source $HOME/dotfiles/.vimrc.plugin.neosnippet
source $HOME/dotfiles/.plugin.jedi_vim.vimrc
source $HOME/dotfiles/.plugin.pymode.vimrc
source $HOME/dotfiles/.vimrc.plugin.vim-quickhl
source $HOME/dotfiles/.vimrc.plugin.unite-outline
source $HOME/dotfiles/.vimrc.plugin.vim-indent-guides
source $HOME/dotfiles/.vimrc.plugin.vim-airline
source $HOME/dotfiles/.vimrc.plugin.YankRing
source $HOME/dotfiles/vimrc/plugin/.vimrc.plugin.savevers
source $HOME/dotfiles/vimrc/plugin/.vimrc.plugin.vim-milfeulle
source $HOME/dotfiles/vimrc/plugin/.vimrc.plugin.vim-easymotion
source $HOME/dotfiles/vimrc/plugin/.vimrc.plugin.qfixgrep
" matchit.vimの有効化
source $VIMRUNTIME/macros/matchit.vim
source $HOME/dotfiles/vimrc/plugin/.vimrc.plugin.matchit
source $HOME/dotfiles/vimrc/plugin/.vimrc.plugin.memolist

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" テンプレート
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
let g:sonictemplate_vim_template_dir = '$HOME/dotfiles/template'
let g:sonictemplate_vim_template_dir = '~/dotfiles/template'
" let g:sonictemplate_vim_template_dir = [
" \ '$HOME/.vim/template',
" \ '$HOME/dotfiles/template'
" \]

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" ローカル設定
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
if filereadable(expand("~/dotfiles/vimrc/.vimrc.local"))
  source ~/dotfiles/vimrc/.vimrc.local
endif

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" mac用設定
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
if has('mac')
  " source $HOME/dotfiles/.vimrc.mac
endif

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" key map
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
source ~/dotfiles/vimrc/.vimrc.keymap

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

" textファイルの場合に自動改行される設定を無効とする
set textwidth=0
autocmd FileType text setlocal textwidth=0
autocmd FileType vim setlocal textwidth=0
" autocmd BufRead *.vimrc setlocal textwidth=0

" 既定のvimgrepを内部grepにする
set grepprg=internal

" CUI上での色指定
colorscheme darkblue

" Quickfixを常に開く
autocmd QuickFixCmdPost *grep* cwindow

" " 検索時に大/小文字を区別しない
set ignorecase
" " 検索時に大文字を含んでいたら大/小を区別
" set smartcase
" " 検索をファイルの先頭へループしない
" " set nowrapscan
" " 検索文字列入力時に順次対象文字列にヒットさせる
" set incsearch
" " 検索結果文字列のハイライトを有効にする
" set hlsearch
"
" " -------------------------------------------------------------------
" vim-anzu関連 {{{

" " " キーマップ設定
" nmap n <Plug>(anzu-jump-n)zz
" nmap N <Plug>(anzu-N)zz
" nmap * <Plug>(anzu-star)
" nmap # <Plug>(anzu-sharp)
" " ESC2回押しで検索ハイライトを消去
" nmap <silent> <ESC><ESC> :<C-u>nohlsearch<CR>
  " \ <Plug>(anzu-clear-search-status)
  " \ <Plug>(quickhl-manual-reset)
" " format = (該当数/全体数)
" let g:anzu_status_format = "(%i/%l)"
" }}}
"
"
" " -------------------------------------------------------------------
" " vim-quickhl関連 {{{
" "
" nmap <Space>m <Plug>(quickhl-manual-this)
" xmap <Space>m <Plug>(quickhl-manual-this)
" nmap <Space>M <Plug>(quickhl-manual-reset)
" xmap <Space>M <Plug>(quickhl-manual-reset)
" "}}}

" http://d.hatena.ne.jp/osyo-manga/20140121/1390309901
" Vim でカーソル下の単語を移動するたびにハイライトするCommentsAdd Star
"" 1 が設定されていれば有効になる
" let g:enable_highlight_cursor_word = 0
let g:enable_highlight_cursor_word = 1

augroup highlight-cursor-word
    autocmd!
    " autocmd CursorMoved * call s:hl_cword()
    " カーソル移動が重くなったと感じるようであれば
    " CursorMoved ではなくて
    " CursorHold を使用する
    autocmd CursorHold * call s:hl_cword()
    " 単語のハイライト設定
    autocmd ColorScheme * highlight CursorWord guifg=Red
    " アンダーラインでハイライトを行う場合
"     autocmd ColorScheme * highlight CursorWord gui=underline guifg=NONE
    autocmd BufLeave * call s:hl_clear()
    autocmd WinLeave * call s:hl_clear()
    autocmd InsertEnter * call s:hl_clear()
augroup END


function! s:hl_clear()
    if exists("b:highlight_cursor_word_id") && exists("b:highlight_cursor_word")
        silent! call matchdelete(b:highlight_cursor_word_id)
        unlet b:highlight_cursor_word_id
        unlet b:highlight_cursor_word
    endif
endfunction

function! s:hl_cword()
    let word = expand("<cword>")
    if    word == ""
    return
    endif
    if get(b:, "highlight_cursor_word", "") ==# word
        return
    endif

    call s:hl_clear()
    if !g:enable_highlight_cursor_word
        return
    endif

    if !empty(filter(split(word, '\zs'), "strlen(v:val) > 1"))
        return
    endif

    let pattern = printf("\\<%s\\>", expand("<cword>"))
    silent! let b:highlight_cursor_word_id = matchadd("CursorWord", pattern)
    let b:highlight_cursor_word = word
endfunction

" cscope
if has("cscope")
  set csprg=/usr/local/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
  set cscopequickfix=s-,c-,d-,i-,t-,e-
endif

" SrcExpl360
let g:SrcExpl_RefreshMapKey = "<Space>"
let g:SrcExpl_GoBackMapKey  = "<C-b>"

" NERDCommenter
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" 現在編集中のバッファのファイル名を変更する
" usage
"   :Rename newfilename
"   強制保存して変更
"   :Rename! newfilename
command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)

filetype on

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" 言語別設定
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

"----------------------------------------
" 言語別設定 > XML
"----------------------------------------
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END



