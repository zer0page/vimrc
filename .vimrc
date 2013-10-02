"=============
"general
set history=700

"enable filetype plugins
filetype plugin on
filetype indent on
set autoread
let mapleader = ","
let g:mapleader = ","
" fast saving example
nmap <leader>w : w!<cr>

"=============
"vim user interface

" 7 line JK
set so=7

set wildmenu
set wildignore=*.o,*~,*.pyc

set ruler
set cmdheight=2
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
"ignore case while searching
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
"for regex turn magic on
set magic
set showmatch
set mat=2

"=============
"color and fonts

syntax enable
set encoding=utf8
set ffs=unix,dos,mac

"=============
"backup
set nobackup
set nowb
set noswapfile

"=============
"tabs and spaces

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"=============
"visual mode search current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"=============
"status line

set laststatus=2
"==============

"Vundle shit
filetype off
set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

filetype plugin indent on



