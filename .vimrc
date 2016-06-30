"=============================================================================
"    Description: .vimrc
"         Author: bonjin6770(twitter:bonjin6770)
"=============================================================================

"=============================================================================
" 初期化
"=============================================================================
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

"=============================================================================
" vim-bootstrap
"=============================================================================
"" Encoding
" set encoding=utf-8
" set fileencoding=utf-8
" set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" allow plugins by file type
filetype on
filetype plugin on

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
" let mapleader=','
let mapleader = "\<Space>"

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Encoding
" set bomb
" set ttyfast
" set binary

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set backspace=indent,eol,start
set showcmd
if('mac')
  set shell=/bin/sh
endif

"*****************************************************************************
"" Visual Settigns
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1
highlight BadWhitespace ctermbg=red guibg=red
colorscheme molokai

set mousemodel=popup
set t_Co=256
set nocursorline
set guioptions=egmrti
" set gfn=Monospace\ 8

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
endif

if &term =~ '256color'
  set t_ut=
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ %{fugitive#statusline()}

let g:airline_theme = 'powerlineish'
" let g:airline_enable_branch = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"*****************************************************************************
"" Abbreviations
let s:settings_abbreviations = 'abbreviations'
"*****************************************************************************

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
" nnoremap <silent> <F2> :NERDTreeFind<CR>
" noremap <F3> :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>gf :Rgrep<CR>
let Grep_Default_Options = '-IR'

" vimshell
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
nnoremap <silent> <leader>sh :VimShellCreate<CR>

"*****************************************************************************
"" Functions
"*****************************************************************************
function! s:setupWrapping()
  set wrap
  set wm=2
  " set textwidth=79
endfunction

function! TrimWhiteSpace()
  let @*=line(".")
  %s/\s*$//e
  ''
endfunction

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

"" Remember cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"" txt
" au BufRead,BufNewFile *.txt call s:setupWrapping()

"" make/cmake
au FileType make set noexpandtab
autocmd BufNewFile,BufRead CMakeLists.txt setlocal ft=cmake

if has("gui_running")
  autocmd BufWritePre * :call TrimWhiteSpace()
endif

set autoread

"*****************************************************************************
"" Mappings
let s:settings_mappings = ''
"*****************************************************************************

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :!git add .<CR>
noremap <Leader>gc :!git commit -m '<C-R>="'"<CR>
noremap <Leader>gsh :!git push<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Tabs
" nnoremap <Tab> gt
" nnoremap <S-Tab> gT
" nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :ex <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" ctrlp.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 0
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
" noremap <leader>p :CtrlPBuffer<CR>
" noremap <leader>ls :CtrlPBuffer<CR>
let g:ctrlp_map = ',e'
let g:ctrlp_open_new_file = 'r'

" snippets
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" let g:UltiSnipsEditSplit="vertical"

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" vim-airline
let g:airline_enable_syntastic = 1

"" Remove trailing whitespace on <leader>S
nnoremap <silent> <leader>S :call TrimWhiteSpace()<cr>:let @/=''<CR>

"" Copy/Paste/Cut
noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
" noremap <leader>z :bp<CR>
" noremap <leader>q :bp<CR>
" noremap <leader>x :bn<CR>
" noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
" nnoremap <silent> <leader><space> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Open current line on GitHub
noremap ,o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>
"" Custom configs

" vim-python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
    \ formatoptions+=croq softtabstop=4 smartindent
    \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"

let g:syntastic_python_checkers=['python', 'flake8']

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

let g:javascript_enable_domhtmlcss = 1

"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"*****************************************************************************
" システム設定
let s:settings_system = ''
"*****************************************************************************

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

"*****************************************************************************
" カーソル移動
let s:settings_mouse_coursor = ''
"*****************************************************************************
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

"*****************************************************************************
" インデント
let s:settings_indent = ''
"*****************************************************************************
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

"*****************************************************************************
" 履歴管理
let s:settings_history = ''
"*****************************************************************************
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

"*****************************************************************************
" 表示設定
let settings_todo_view = ''
"*****************************************************************************

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
set shortmess+=I
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

"*****************************************************************************
" 検索設定
let s:settings_search = ''
"*****************************************************************************
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

"*****************************************************************************
" 置換設定
let s:settings_replace = ''
"*****************************************************************************
" s*でカーソル下のキーワードを置換
nnoremap <expr> s* ':%s/\<' . expand('<cword>') . '\>/'
vnoremap <expr> s* ':s/\<' . expand('<cword>') . '\>/'

"*****************************************************************************
" ステータスライン
let s:settings_status_line = ''
"*****************************************************************************
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
" tagsファイルを探すディレクトリを、対象ファイルのあるディレクトリからの相対位置からにする
set tags=./tags;

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" diff設定
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
"----------------------------------------
" diff設定 > deff/patch
"----------------------------------------
if has('win32') || has('win64')
  set diffexpr=MyDiff()
  function! MyDiff()
    " 7.3.443 以降の変更に対応
    silent! let saved_sxq=&shellxquote
    silent! set shellxquote=
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let cmd = '!diff ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    silent execute cmd
    silent! let &shellxquote = saved_sxq
  endfunction
endif

" 現バッファの差分表示(変更箇所の表示)
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
" ファイルまたはバッファ番号を指定して差分表示。#なら裏バッファと比較
command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit|else| vertical diffsplit <args>|endif
" パッチコマンド
set patchexpr=MyPatch()
function! MyPatch()
   call system($VIM."\\'.'patch -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff)
endfunction

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" 辞書設定
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" 拡張子を判断しての読み込み
autocmd FileType php :set dictionary=D:\vim\vimfiles\dictionary\php.dict

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" 短縮入力設定
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" シンタックスハイライト
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
"----------------------------------------
" Description: markdown記法のシンタックスハイライト
"              https://github.com/tpope/vim-markdown
"              上記の設定を参照
"              ~/.vim/ftdetect/markdown.vim
"              ~/.vim/ftplugin/markdown.vim
"              ~/.vim/syntax/markdown.vim
"              上記のファイルを設置
"    Modified: 2014-05-28
"----------------------------------------
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"=============================================================================
" プラグイン設定
"=============================================================================
<<<<<<< HEAD
source $HOME/dotfiles/.vimrc.plugin.neobundle
" source $HOME/dotfiles/.plugin.neocomplete.vimrc
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

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

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
=======
" -------------------------------------------------------------------
" プラグイン設定 > neobundle
" -------------------------------------------------------------------
if has('vim_starting')
  " Be iMproved
  set nocompatible
  " neobundle.vimをインストールしたディレクトリを指定
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete'
" NeoBundle 'Shougo/neosnippet-snippets'
" NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'yonchu/accelerated-smooth-scroll'
" NeoBundle 'klen/python-mode.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'vim-scripts/SingleCompile'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle "t9md/vim-quickhl"
NeoBundle 'vim-scripts/ctags.vim'
NeoBundle 'vim-scripts/mru.vim'
NeoBundle "Shougo/unite-outline"
NeoBundle 'vim-scripts/vimdir.vim'
NeoBundle 'vim-scripts/ReplaceWithSameIndentRegister'
" NeoBundle 'vim-scripts/ShowWhiteSpace'
NeoBundle 'vim-scripts/exjumplist'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'vim-scripts/bufferlist.vim'
NeoBundle 'wesleyche/SrcExpl'
NeoBundle 'taglist.vim'
" NeoBundle 'Source-Explorer-srcexpl.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'vim-scripts/FavEx'
NeoBundle 'mattn/sonictemplate-vim'
NeoBundle 'vim-scripts/tagexplorer.vim'
" NeoBundle 'vim-scripts/Changed'
NeoBundle 'vim-scripts/closetag.vim'
NeoBundle "osyo-manga/vim-milfeulle"
" NeoBundle "mhinz/vim-startify"
NeoBundle "terryma/vim-expand-region"
NeoBundle "vim-scripts/savevers.vim"
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'thinca/vim-poslist'
" NeoBundle 'vim-scripts/ShowMarks'
NeoBundle 'vim-scripts/Visual-Mark'
" NeoBundle 'jacquesbh/vim-showmarks'
NeoBundle 'vim-scripts/BufOnly.vim'
" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
" NeoBundle 'szw/vim-tags'
" 自動で閉じる
NeoBundle 'tpope/vim-endwise'
" NeoBundle 'xolox/vim-easytags'
" NeoBundle 'supermomonga/projectlocal.vim'

" Snippete
if has('lua') && (( v:version == 703 && has('patch885')) || (v:version >= 704))
  NeoBundle 'Shougo/neocomplete'
else
  NeoBundle 'Shougo/neocomplcache'
endif
NeoBundle "Shougo/neosnippet"
NeoBundle "Shougo/neosnippet-snippets"
NeoBundle "honza/vim-snippets"
" NeoBundle "rcmdnk/vim-octopress-snippets"


NeoBundleLazy 'vim-jp/cpp-vim', {
            \ 'autoload' : {'filetypes' : 'cpp'}
            \ }
NeoBundleLazy 'osyo-manga/vim-stargate', {
            \ 'autoload' : {'filetypes' : 'cpp'}
            \ }

NeoBundle 'vim-scripts/delphi.vim'

" FOR C++
NeoBundle 'vim-scripts/Switch-cpp-header-files'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'bling/vim-airline'
" NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'vim-scripts/CSApprox'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vimshell.vim'

"" Snippets
" NeoBundle 'SirVer/ultisnips'

"" Color
NeoBundle 'tomasr/molokai'

"" Python Bundle
NeoBundle "davidhalter/jedi-vim"
NeoBundle "scrooloose/syntastic"
NeoBundle "majutsushi/tagbar"
" NeoBundle "Yggdroot/indentLine"

"" C Bundle
NeoBundle 'vim-scripts/c.vim'


"" HTML Bundle
""NeoBundle 'amirh/HTML-AutoCloseTag'
" NeoBundle 'hail2u/vim-css3-syntax'
" NeoBundle 'gorodinskiy/vim-coloresque'
" NeoBundle 'tpope/vim-haml'

"" PHP Bundle
NeoBundle 'arnaud-lb/vim-php-namespace'

"" Javascript Bundle
NeoBundle "scrooloose/syntastic"

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck

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

" -------------------------------------------------------------------
" プラグイン設定 > qfixgrep
" -------------------------------------------------------------------

"Grepコマンドのキーマップ
let MyGrep_Key  = '<space>'
"Grepコマンドの2ストローク目キーマップ
let MyGrep_KeyB = 'g'

" let mygrepprg = 'internal'

" 検索は常に再帰検索
let MyGrep_RecursiveMode = 1

" let MyGrepcmd_regexp_ignore = 1

" ユーザ定義可能な追加オプション
let MyGrepcmd_useropt = '-i'

" QFixGrepの検索時にカーソル位置の単語を拾う/拾わない
let MyGrep_DefaultSearchWord = 1

" -------------------------------------------------------------------
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

noremap j gj
noremap k gk

" Shift + h で左端
noremap <S-h>   ^
" Shift + lで右端にカーソル移動
noremap <S-l>   $

noremap <S-j>   }
noremap <S-k>   {
" noremap m  %
" バッファ全体のインデント整理
nnoremap == gg=G''
" オムニ補完をキー一発でできるように設定
inoremap <C-f> <C-x><C-o>

" カーソルから行末までコピー
" vi との互換のために行全体をコピーする仕様らしいが、
" 他のキー(C,D)との兼ね合いも含めて変更する。
nnoremap Y y$
" 改行を含めないで全体をヤンク
nnoremap yl ^y$

" ビジュアルモードで < > キーによるインデント後にビジュアルモードが解除されないようにする
vnoremap < <gv
vnoremap > >gv

" poslist
" 履歴を移動するマッピング
map g; <Plug>(poslist-prev-pos)
map g, <Plug>(poslist-next-pos)

" nnoremap <Tab> gt
" nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"*****************************************************************************
" <leader>
"*****************************************************************************
" Map leader to ,
" let mapleader=','
let mapleader = "\<Space>"

" input number
nmap <silent><leader>bm :ls<CR>:buf

" 左手だけでコピーアンドペーストができるように
noremap <leader><C-c> y
vnoremap <leader><C-c> y
noremap <leader><C-v> p
vnoremap <leader><C-v> p
noremap <leader><C-z> u
noremap <leader><C-z> <C-r>


" <Leader>a
" <Leader>b
" <Leader>c : quickfix用のプレフィックス
" map <leader>cl :cclose<CR>
" map <leader>co :copen<CR>

" buffer
noremap <leader>w :bn<CR>
noremap <leader>q :bp<CR>
noremap <leader>d :bd<CR>

" カーソル位置の単語選択
" noremap <leader>e viw
" カーソル位置の単語ヤンク
noremap <leader>e yiw
vnoremap <leader>e y

" ダブルクォートの中身を選択
noremap <leader>e vi"
" va" → a : a : ダブルクォートを含んだ検索
" noremap <leader>e va"
" vi"p : ダブルクォートの中身を選択した後、ペースト
" noremap <leader>e vi"p

"<Leader><Leader>で変更があれば保存
noremap <Leader><Leader><Leader> :up<CR>

" ScrExpl
" nnoremap <Leader>o :SrcExplToggle<CR>

" savevers.vim VersDiffから抜ける
noremap <Leader>vq :VersDiff -c<CR>

" memolist.vim
map <Leader>'n  :MemoNew<CR>
map <Leader>'l  :MemoList<CR>
map <Leader>'g  :MemoGrep<CR>

" vim-easymotion
" JK motions: Line motions
"# keep cursor colum JK motion
let g:EasyMotion_startofline = 0
nmap <Leader>j <Plug>(easymotion-j)
vmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
vmap <Leader>k <Plug>(easymotion-k)
nmap <Leader>j <Plug>(easymotion-sol-j)
vmap <Leader>j <Plug>(easymotion-sol-j
nmap <Leader>k <Plug>(easymotion-sol-k)
vmap <Leader>k <Plug>(easymotion-sol-k)

nmap <Leader>l <Plug>(easymotion-w)
vmap <Leader>l <Plug>(easymotion-w)
nmap <Leader>h <Plug>(easymotion-b)
vmap <Leader>h <Plug>(easymotion-b)

" nmap <Leader>; <Plug>(easymotion-jumptoanywhere)
" vmap <Leader>; <Plug>(easymotion-jumptoanywhere)

Bi-directional find motion
Jump to anywhere you want with minimal keystrokes, with just one key binding.
`s{char}{label}`
nmap <leader>s <Plug>(easymotion-s)

or
`s{char}{char}{label}`
Need one more keystroke, but on average, it may be more comfortable.
nmap <leader>s <Plug>(easymotion-s2)

" Quickfixウィンドウの開閉をトグルするAdd Star
function! s:toggle_quickfix_window()
  for _ in range(1, winnr('$'))
    execute _ . 'wincmd w'
    if &l:filetype ==# 'qf'
      close
      return
    endif
  endfor
  cwindow
endfunction
nnoremap <silent> <Leader>9 :<C-u>call <SID>toggle_quickfix_window()<CR>
"=============================================================================
" The prefix key.
"=============================================================================
nnoremap [Tag] <Nop>
nmap    t [Tag]

nnoremap [Tag]t <C-]>
nnoremap <silent> [Tag]n :<C-u>tag<CR>
nnoremap <silent> [Tag]p :<C-u>pop<CR>
nnoremap <silent> [Tag]l :<C-u>tags<CR>

" <C-G> grep
nmap <C-G> :vimgrep /<C-R><C-W>/j %

" <F1> Vim Help
" <F2>
" <F3> カーソルがある行から [count] 個先の小文字のマークがある行の最初の非空白文字へ移動します。{Vi にはありません}
" nnoremap <F3> :<C-u>call <SID>AutoMarkrement_NextJump()<CR>
" <F4>

" <F5>
" map <silent> <F5> :NERDTree b:projectlocal_root_dir

" <F6> SrcExpl.vim
" nnoremap <F6> :SrcExplToggle<CR>

" <F6>

" <F7> 前の該当位置へジャンプ
nnoremap <F7> :cprevious <CR>

" <F8> 次の該当位置へジャンプ
nnoremap <F8> :cnext <CR>

" <F9>

" <F10>
noremap <silent> <F10> :NERDTreeToggle<CR>
" nnoremap <silent> <F10> :NERDTreeFind<CR>
" <F11>
" <F12> 検索結果の表示()
nnoremap <F12> <C-]>
" -------------------------------------------------------------------
" S-F[1~12]
"

" <S-F1>
" <S-F2>
" <S-F3>
" カーソル位置より [count] 個前の小文字のマークへ移動します。{Vi にはありません}
" nnoremap <silent> <S-F3> :NERDTreeFind<CR>
" nnoremap <S-F3> :<C-u>call <SID>AutoMarkrement_PreJump()<CR>
" <S-F4> Template
nnoremap <S-F4> :Template<Space>
" <S-F5>
" nmap <S-F5> :ls<CR>:b
map <silent> <S-F5> :call BufferList()<CR>
" <S-F6>
" <S-F7>  savevers.vim ひとつ前のバックアップと比較
nnoremap <S-F7> :VersDiff -<CR>
" <S-F8> savevers.vim ひとつ後のバックアップと比較
nnoremap <S-F8> :VersDiff +<CR>
" <S-F9> savevers.vim VersDiffから抜ける
nnoremap <S-F9> :VersDiff -C<CR>
" <S-F10>
" <S-F11> 現在開いているすべてのバッファからgrep
"         見えているバッファからgrepする場合は、bufdoの代わりにwindoを使う
"         実行するたびにQuickfixが追加されてしまうので、 cexpr "" を実行すること
nnoremap <S-F11> :bufdo vimgrepadd /<C-R><C-K>/j **/* %<CR>
" <S-F12> カーソル位置の単語でgrep
nnoremap <S-F12> :vimgrep /<C-R><C-W>/j **/*

" Mark用
if !exists('g:markrement_char')
  let g:markrement_char = [
        \     'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
        \     'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
        \ ]
endif

if !exists('g:markrement_jump_pos')
  let g:markrement_jump_pos = 0
endif

" nnoremap <silent>m :<C-u>call <SID>AutoMarkrement()<CR>

function! s:AutoMarkrement()
  if !exists('b:markrement_mark_pos')
    let b:markrement_mark_pos = 0
    let g:markrement_jump_pos = 0
  else
    let b:markrement_mark_pos = (b:markrement_mark_pos + 1) % len(g:markrement_char)
    let g:markrement_jump_pos = (b:markrement_mark_pos + 1) % len(g:markrement_char)
  endif
  execute 'mark' g:markrement_char[b:markrement_mark_pos]
  echo 'marked' g:markrement_char[b:markrement_mark_pos]
endfunction

function! s:AutoMarkrement_NextJump()
  let g:markrement_jump_pos = (g:markrement_jump_pos + 1) % len(g:markrement_char)
  echo 'jump to ' . (g:markrement_char[g:markrement_jump_pos])
  execute 'normal `' . (g:markrement_char[g:markrement_jump_pos])
endfunction

function! s:AutoMarkrement_PreJump()
  execute 'normal `' . (g:markrement_char[g:markrement_jump_pos - 1] )
  echo 'jump to ' . (g:markrement_char[g:markrement_jump_pos - 1])
  if g:markrement_jump_pos <= 0
    let g:markrement_jump_pos = len(g:markrement_char) - 1
  else
    let g:markrement_jump_pos = (g:markrement_jump_pos - 1) % len(g:markrement_char)
  endif
endfunction

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" その他？
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
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
" -------------------------------------------------------------------
" vim-quickhl関連 {{{

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

" 非GUI日本語コンソールを使っている場合の設定
if !has('gui_running') && &encoding != 'cp932' && &term == 'win32'
  set termencoding=cp932
endif
