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

"ignore case while searching
set ignorecase

"NerdTree Settings
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show hidden files e.g. .ruby-version
let NERDTreeShowHidden=1
" Hide the temp .swp files created by vim
let NERDTreeIgnore = ['\.swp$']

"Highlight the currentline in the current pane
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

" File of extension .txt should have soft wrap enabled
autocmd BufNewFile,BufRead *.txt set wrap

" Save the file using C-s
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif

nnoremap <c-s> :Update<CR>
inoremap <c-s> <esc>:Update<CR>

"This sets the theme for Airline Plugin
let g:airline_theme='wombat'

" This was added for vim-ruby plugin
set nocompatible      " We're running Vim, not Vi!
" syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Set incremental search (as you type) and case insensitive search
set incsearch
set ignorecase

"Prepare vim for 256 color schemes
let g:solarized_termcolors=256

" Set colorschemes for solarized (light|dark)
syntax enable
set background=dark
colorscheme solarized


"This highlights the 80th column as a marker
"set colorcolumn=80
function! g:ToggleColorColumn()
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    setlocal colorcolumn=+1
  endif
endfunction

"Toggle colorcolumn on/off by :cc
cnoreabbrev cc call g:ToggleColorColumn()


"Delete trailing whitespace on lines
autocmd BufWritePre * :%s/\s\+$//e

" This maps <ESC> to jk
:inoremap <esc> <nop>
:inoremap jk <esc>

" Navigate through tabs using Alt/Option + h/l
nnoremap ˙ :tabprevious<CR>
nnoremap ¬ :tabnext<CR>

" This enables using ctrl j/k/h/l to navigate splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Use system's clipboard to copy paste things
set clipboard=unnamed
