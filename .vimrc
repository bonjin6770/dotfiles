"=============================================================================
"    Description: .vimrc
"         Author: bonjin6770(twitter:bonjin6770)
"=============================================================================
" " 初期化
source ~/dotfiles/vimrc/.vimrc.init

" vim-bootstrap
source $HOME/dotfiles/.vimrc.vim-bootstrap

" システム設定
source $HOME/dotfiles/.vimrc.system

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

" ローカル設定
source ~/dotfiles/vimrc/.vimrc.local

" mac用設定
if has('mac')
  " source $HOME/dotfiles/.vimrc.mac
endif

" key map
source ~/dotfiles/vimrc/.vimrc.keymap

let g:sonictemplate_vim_template_dir = '~/dotfiles/template'
" let g:sonictemplate_vim_template_dir = [
" \ '$HOME/.vim/template',
" \ '$HOME/dotfiles/template'
" \]

" プラグイン設定
source $HOME/dotfiles/.vimrc.plugin.neobundle
source $HOME/dotfiles/.plugin.neocomplete.vimrc
" source $HOME/dotfiles/.vimrc.plugin.neosnippet
source $HOME/dotfiles/.plugin.jedi_vim.vimrc
source $HOME/dotfiles/.plugin.pymode.vimrc
source $HOME/dotfiles/.vimrc.plugin.vim-quickhl
source $HOME/dotfiles/.vimrc.plugin.unite-outline
source $HOME/dotfiles/.vimrc.plugin.vim-indent-guides
source $HOME/dotfiles/.vimrc.plugin.vim-airline
source $HOME/dotfiles/.vimrc.plugin.YankRing
source $HOME/dotfiles/vimrc/plugin/.vimrc.plugin.savevers
source $HOME/dotfiles/vimrc/plugin/.vimrc.plugin.vim-milfeulle
" matchit.vimの有効化
source $VIMRUNTIME/macros/matchit.vim
source $HOME/dotfiles/vimrc/plugin/.vimrc.plugin.matchit
source $HOME/dotfiles/vimrc/plugin/.vimrc.plugin.memolist

" テンプレートのテスト
let g:sonictemplate_vim_template_dir = '$HOME/dotfiles/template'

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

" 既定のvimgrepを内部grepにする
set grepprg=internal

" CUI上での色指定
colorscheme darkblue

" Quickfixを常に開く
autocmd QuickFixCmdPost *grep* cwindow

nmap <S-F5> :ls<CR>:buf

" neocomplcache
" neocomplcacheを起動時に有効化する
" let g:neocomplcache_enable_at_startup = 1
" " 大文字が入力されるまで大文字小文字の区別を無視する
" let g:neocomplcache_enable_smart_case = 1
" " _(アンダーバー)区切りの補完を有効化します
" let g:neocomplcache_enable_underbar_completion = 1
" " シンタックスをキャッシュするときの最小文字長を3にしています。
" let g:neocomplcache_min_syntax_length = 3
" " ディクショナリ定義
" let g:neocomplcache_dictionary_filetype_lists = {
"     \ 'default' : '',
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions',
"     \ 'php' : $HOME . '/.vim/dict/php.dict'
"         \ }
" " Define keyword.
" if !exists('g:neocomplcache_keyword_patterns')
"     let g:neocomplcache_keyword_patterns = {}
" endif
" " キーワードパターンの設定
" let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" " 補完ウィンドウの設定
" set completeopt=menuone
" " ポップアップメニューで表示される候補の数
" let g:neocomplcache_max_list = 20
" "tabで補完候補の選択を行う
" "inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
" " inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
" " スニペットを展開する。スニペットが関係しないところでは行末まで削除
" imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
" smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
" " 前回行われた補完をキャンセルします
" inoremap <expr><C-g> neocomplcache#undo_completion()
" " 補完候補のなかから、共通する部分を補完します
" inoremap <expr><C-l> neocomplcache#complete_common_string()
" " <C-h>や<BS>を押したときに確実にポップアップを削除します
" inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>
" " 現在選択している候補を確定します
" inoremap <expr><C-y> neocomplcache#close_popup()
" " 現在選択している候補をキャンセルし、ポップアップを閉じます
" inoremap <expr><C-e> neocomplcache#cancel_popup()
" " 改行で補完ウィンドウを閉じる
" inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
" " 手動でneocomplcacheを起動する
" inoremap <expr><C-n> neocomplcache#start_manual_complete()
" " 自動でneocomplcacheが起動するのをやめる
" let g:neocomplcache_disable_auto_complete = 1
" neocomplcache END"

" " 検索時に大/小文字を区別しない
" set ignorecase
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
" " vim-anzu関連 {{{
" "
" " キーマップ設定
" nmap n <Plug>(anzu-jump-n)zz
" nmap N <Plug>(anzu-N)zz
" nmap * <Plug>(anzu-star)
" nmap # <Plug>(anzu-sharp)
" " ESC2回押しで検索ハイライトを消去
" nmap <silent> <ESC><ESC> :<C-u>nohlsearch<CR>
"   \ <Plug>(anzu-clear-search-status)
"   \ <Plug>(quickhl-manual-reset)
" " format = (該当数/全体数)
" let g:anzu_status_format = "(%i/%l)"
" "}}}
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
    autocmd CursorMoved * call s:hl_cword()
    " カーソル移動が重くなったと感じるようであれば
    " CursorMoved ではなくて
    " CursorHold を使用する
"     autocmd CursorHold * call s:hl_cword()
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

" ctrlp.vim
" let g:ctrlp_map = '<s-c-p>'
" let g:ctrlp_cmd = 'CtrlP'


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

" 目指す構造化！
" " 初期化
" source ~/dotfiles/vimrc/.vimrc.init
"
" " NeoBundle設定
" source ~/dotfiles/vimrc/.vimrc.bundle
"
" " 基本設定
" source ~/dotfiles/vimrc/.vimrc.basic
"
" " 文字コード設定
" source ~/dotfiles/vimrc/.vimrc.encoding
"
" " 表示設定
" source ~/dotfiles/vimrc/.vimrc.appearance
"
" " カラースキーマ設定
" source ~/dotfiles/vimrc/.vimrc.colorscheme
"
" " インデント設定
" source ~/dotfiles/vimrc/.vimrc.indent
"
" " 検索設定
" source ~/dotfiles/vimrc/.vimrc.search
"
" " キーマッピング設定
" source ~/dotfiles/vimrc/.vimrc.keymap
"
" " ファイルタイプ設定
" source ~/dotfiles/vimrc/.vimrc.filetype
"360
" " プラグイン設定
" source ~/dotfiles/vimrc/.vimrc.plugin

" ローカル設定
" source ~/dotfiles/vimrc/.vimrc.local
