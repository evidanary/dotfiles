" pathogen runntime injection and help indexing
execute pathogen#infect()

" Set the leader key
let mapleader = ","
nnoremap <leader>d dd

"Leader lt maps to last tab
let g:lasttab = 1
nmap <Leader>lt :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

"Leader gf copies word under cursor to ctrlp
nmap <leader>gf :CtrlP<CR><C-\>w

" set line numbering, shift width
set relativenumber
set tabstop=2
set expandtab
set shiftwidth=2
set cursorline

" Remapping surround with for tpope's surround plugin
nmap ms ys
nmap mS ysiw

" For RSpec tests we use vimux plugin
" Run all spec files
nnoremap <leader>r :VimuxRunCommand "bundle exec rake spec"<CR>
" Run the current file with rspec
nnoremap <leader>c :VimuxRunCommand "bundle exec rspec ". bufname("%")<CR>
" Run the last command
nnoremap <leader>l :VimuxRunLastCommand<CR>

" Yank in visual mode returns cursor to end of selection
vnoremap y myy`y
vnoremap Y myY`y

"Show branch name in Status line
set statusline=%{fugitive#statusline()}

"Configure silver searcher (Ag)
let g:ag_working_path_mode="r"

"Prevent ex-mode from being activated for commonly mistyped keys
map q: <Nop>
nnoremap Q <nop>

"NerdTree Settings
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Ctrlp.vim settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip

" Map Commonly occurring mistypes, typos
" Map Wa to wa
cnoreabbrev Wa wa
cnoreabbrev Wq wq
cnoreabbrev Q q

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
" Files of extension .md should be marked as markdown and not modula2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"This sets the theme for Airline Plugin
let g:airline_theme='luna'

" This was added for vim-ruby plugin
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Set incremental search (as you type) and case insensitive search
set incsearch
set ignorecase

"Prepare vim for 256 color schemes
set t_Co=256
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
:inoremap :Wa <esc>:wa<CR>
:inoremap :wa <esc>:wa<CR>

" This maps :qt to :tabclose
cnoreabbrev qt tabclose

" Navigate through tabs using Alt/Option + h/l
nnoremap ˙ :tabprevious<CR>
nnoremap ¬ :tabnext<CR>

" This enables using ctrl j/k/h/l to navigate splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" try to toggle paste
set pastetoggle=<F2>
inoremap <F2> :set pastetoggle

" Use system's clipboard to copy paste things (not working)
set clipboard=unnamed
