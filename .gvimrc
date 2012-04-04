" An example for a gvimrc file.
" The commands in this are executed when the GUI is started.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Sep 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"	      for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"	    for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

set ch=1		" Make command line two lines high

set mousehide		" Hide the mouse when typing text

" eric setting starts from here ##################################
" for use twilight colorscheme
"colorscheme processing-dark
colorscheme neon
" for window width,height
set columns=100
set lines=45
" for antialias
"set macatsui 
"set anti enc=utf-8 tenc=macroman gfn=Monaco:h12
set anti
" for Japanese antialias mojibake
set termencoding=japan
set gfn=Osaka-Mono:h14
set gfw=Osaka-Mono:h12
" for menu mojibake
source $VIMRUNTIME/delmenu.vim
set langmenu=menu_ja_jp.utf-8.vim
source $VIMRUNTIME/menu.vim
" for create new file with 'utf-8' encoding.
set fenc=utf-8
" for incremental search
set incsearch
set wrapscan
set nu
autocmd BufRead *.as set filetype=actionscript
autocmd BufRead *.thtml set filetype=php
" for use javasyntax highlight
:let java_highlight_all=1
" for use hlsearch
"set hlsearch
" for transparency
":set transparency=200
" for romaji search with Japanese
"set migemo
" for Insert with changint to Japanese off
"set iminsert=0 imsearch=0
" eric setting end here #########################################

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" statusbar setting
set laststatus=2
set statusline=%<%f\ %m%r%h%w[%{&fileformat}][%{has('multi_byte')&&\ &fileencoding!=''?&fileencoding:&encoding}]\ 0x%B%=%l,%c\ %P
colorscheme neon    " 驟崎牡繝代ち繝ｼ繝ｳ 竊地eon
set guicursor=a:blinkon0
set smartindent
set backspace=indent,eol,start
set showmatch
set hi=50
set transparency=7

set nu
set hls
sy on
set nocompatible

" 検索
set incsearch
set ignorecase

" Tab設定
set ts=4 sw=4 sts=0
set listchars=tab:\>\ ,eol:<,trail:_
set list

" 全角スペースの強調
"highlight ZenkakuSpace guibg=gray
"match ZenkakuSpace /　/

" file type setting
filetype plugin on
filetype indent on

au FileType ruby set ts=2 sw=2 expandtab

" for match ruby's do~end
source $VIMRUNTIME/macros/matchit.vim

" set swp file directory
set directory=~/.tmp/
