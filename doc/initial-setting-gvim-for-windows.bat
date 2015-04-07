@echo off
REM このファイルは、gvimの環境設定用に作成した。

:SELECT
echo このバッチファイルを実行する前に、gitのプロキシ設定を完了させてください。
echo プロキシ設定は完了済みですか？
set /p ANSER="y/nのどちらかを入力してください:"
if "%ANSER%"=="y" goto EXEC
if "%ANSER%"=="n" exit
goto SELECT

:EXEC
cd %HOMEPATH%
mkdir .vim\bundle
cd .vim\bundle
git clone https://github.com/Shougo/neobundle.vim

cd %HOMEPATH%
git clone https://github.com/bonjin6770/dotfiles

mklink %HOMEPATH%"\.vimrc" %HOMEPATH%"\dotfiles\.vimrc"
mklink %HOMEPATH%"\.gvimrc" %HOMEPATH%"\dotfiles\.gvimrc"

mklink /D %HOMEPATH%"\vimfiles" %HOMEPATH%"\dotfiles"
mklink /D %HOMEPATH%"\vimfiles\indent" %HOMEPATH%"\dotfiles\indent"
mklink /D %HOMEPATH%"\vimfiles\colors" %HOMEPATH%"\dotfiles\colors"
mklink /D %HOMEPATH%"\vimfiles\dict" %HOMEPATH%"\dotfiles\dict"

pause
