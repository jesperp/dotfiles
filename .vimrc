call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'jmcantrell/vim-virtualenv'
call plug#end()

filetype plugin on

" Colors
set background=dark
syntax enable
let g:solarized_termcolors=256
colorscheme solarized

" Awesomeness
set autoindent
set backspace=indent,eol,start
set ignorecase
set laststatus=2
set listchars+=nbsp:.
set nowrap
set nu
set ruler
set showcmd
set smartcase
set wildmode=longest,list
"set shellcmdflag=-ic   " NOTE This breaks stuff with ZSH

" File type aliases
au BufNewFile,BufRead *.swig set filetype=htmldjango
au BufNewFile,BufRead *.gyp set filetype=python

" ------------------- Mappings -----------------
nmap <BS> X
nmap _ <C-W>_
nmap <silent> <Left> :bprev<CR>
nmap <silent> <Right> :bnext<CR>
nmap <S-TAB> <<
nmap <Enter> <C-]>
nmap <TAB> >>


if has("gui_macvim")
    set guifont=Menlo_Regular:h12
endif

" Bind '' to ``, much easier to type and it's the only one of the two I'm using
nn '' ``zz


" GREP'ing
"set grepprg=grep\ -nR\ $*\ *
"nmap <C-P> :cprevious<CR>
"nmap <C-N> :cnext<CR>


" Jump between placeholder "…" (unicode U+2026) in insert mode 
inoremap <C-J> <ESC>/…<cr>s

" ctags
nmap <C-H> :tprevious<CR>
nmap <C-L> :tnext<CR>

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ["eslint"]

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'molokai'
let g:airline_section_y = '0x%-4B %{airline#util#wrap(airline#parts#ffenc(),0)}'  " Include hexvalue of char under cursor

" Ag (The Silver Searcher)
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore node_modules
      \ --ignore .hg
      \ --ignore ".*.swp"
      \ --ignore "*.svg"
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
