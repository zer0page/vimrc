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
colo seoul256
hi Normal ctermbg=NONE
"set background=dark
"=======
"Lines
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
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
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc|swo|swp|zip)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"===
"Commenter
"visual mode + c[cnmis]
Bundle 'scrooloose/nerdcommenter'

"=====
"rust
Plugin 'rust-lang/rust.vim'

"=====
" golang
Plugin 'fatih/vim-go'
let g:go_bin_path = expand("~/.gotools")
let g:syntastic_go_checkers = ['gofmt', 'golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode' : 'active', 'passive_filetypes': ['go'] }
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 0

"==================
"some other crap
filetype plugin indent on


"==================
"ctags
"
set tags=tags;/
Plugin 'craigemery/vim-autotag'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
nnoremap <leader>g <C-]>
nnoremap <leader>r <C-T>
Plugin 'majutsushi/tagbar'
nmap <leader>f :TagbarToggle<CR>

"==================
"neocomplete
Plugin 'Shougo/neocomplete'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" " Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_ctags_program = "ctags"
let g:neocomplete#sources#tags#cache_limit_size=2000000
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }
" Recommended key-mappings.
" " <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    "For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
"   " <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"   " <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javacriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#ctags_command = "ctags"
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
