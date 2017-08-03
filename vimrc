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
nnoremap <leader>g <C-]>
nnoremap <leader>r <C-T>
Plugin 'majutsushi/tagbar'
nmap <leader>l :TagbarToggle<CR>

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


"==================
"cscope
function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
    endif
endfunction
au BufEnter /* call LoadCscope()

if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    "nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <Leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <Leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    "nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    "nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

    "nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    "nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    "nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    "nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    "nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    "nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    "nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

endif


