" turn filetype detection off and, even if it's not strictly
" necessary, disable loading of indent scripts and filetype plugins
filetype off
filetype plugin indent off

" pathogen runntime injection and help indexing
execute pathogen#infect()
call pathogen#helptags()

" turn filetype detection, indent scripts and filetype plugins on
" and syntax highlighting too
filetype plugin indent on
syntax on

" Set line numbering, shift width
set number
set shiftwidth=2
set cursorline

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" This was added for vim-ruby plugin
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" This maps <ESC> to jk
:inoremap <esc> <nop>
:inoremap jk <esc>

" Navigate through tabs using Alt/Option + h/l
nnoremap ∆ :tabprevious<CR>
nnoremap ˚ :tabnext<CR>

" This enables using ctrl j/k/h/l to navigate splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Use system's clipboard to copy paste things
set clipboard=unnamed
