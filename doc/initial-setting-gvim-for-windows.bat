@echo off
REM ���̃t�@�C���́Agvim�̊��ݒ�p�ɍ쐬�����B

:SELECT
echo ���̃o�b�`�t�@�C�������s����O�ɁAgit�̃v���L�V�ݒ�����������Ă��������B
echo �v���L�V�ݒ�͊����ς݂ł����H
set /p ANSER="y/n�̂ǂ��炩����͂��Ă�������:"
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
