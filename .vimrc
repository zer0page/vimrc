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
" jumping buffers
:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>
:nnoremap <C-x> <C-W>q
"=============
"vim user interface

" 7 line JK
set so=7
set ttimeoutlen=50
set showbreak=...

set wildmenu
set wildignore=*.o,*~,*.pyc

set ruler
set number
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
"buffers and tabs
set hidden
"=============
"color and fonts

syntax enable
set encoding=utf8
set ffs=unix,dos,mac
set t_Co=256

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
"===============
"Base Bundle
Bundle 'gmarik/vundle'
"===============
"Everything else
"
"========
"Themes
Bundle 'flazz/vim-colorschemes'
Bundle 'junegunn/seoul256.vim'
colors seoul256
hi Normal ctermbg=NONE
"=======
"Lines
Bundle 'bling/vim-airline'
let g:airline#extension#tabline#enabled = 1
let g:airline#extension#tabline#left_sep = ' '
let g:airline#extension#tabline#left_alt_sep = '|'
let g:airline_theme='bubblegum'
set noshowmode

"=======
"Syntax
Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_aggregate_errors=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_c_checkers =['gcc']

"======
"tmux integration
Bundle 'christoomey/vim-tmux-navigator'
"=====
"bufferline
Bundle 'bling/vim-bufferline'
let g:bufferline_echo=0
autocmd VimEnter *
    \ let &statusline='%{bufferline#refresh_status()}'
    \ .bufferline#get_status_string()
let g:bufferline_modified='*'
let g:bufferline_active_hightlight = 'StatusLine'
let g:bufferline_solo_hightlight = 1

"=====
"easy motion
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader><Leader>'
"====
"file browser
Bundle 'scrooloose/nerdtree'
noremap <Leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"===
"Fuzzy file finder
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc|swo|swp|zip)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"==================
"some other crap
filetype plugin indent on



