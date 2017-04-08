execute pathogen#infect()
filetype plugin indent on

" Solarized
syntax enable
set background=light
colorscheme solarized

" Use the comma as the leader
let mapleader=","

set backspace=indent,eol,start " backspace over everything in insert mode

" Needed for Command-T to work
execute pathogen#helptags()

" Define different mappings for Command-T
nmap <silent> <Leader>f <Plug>(CommandT)

" NERDTree opens with '\', '|' opens current file on NERDTree
nmap \ :NERDTreeToggle<CR>
nmap \| :NERDTreeFind<CR>

" Silver Searcher (`brew install the_silver_searcher` first)
" let g:ackprg='ag --nogroup --nocolor --column'
let g:ackprg = 'ag --vimgrep'

" Enable line numbers
set nu

" CommandT ignore node_modules & bower_components
let g:CommandTWildIgnore=&wildignore . "*/node_modules,*/bower_components,*\.png,*\.gif,*\.ico,*\.jpg,*\.jpeg,*\.svg"

" Highlight search matches (*)
set hlsearch

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Indent without tabs
set expandtab
set shiftwidth=2
set softtabstop=2

" Use Ctrl+(h/l) to cycle windows
nmap <silent> <c-h> :tabprevious<CR>
nmap <silent> <c-l> :tabnext<CR>

" Automatically remove whitespace before saving
autocmd BufWritePre * %s/\s\+$//e

" mouse things
set mouse=a
set ttymouse=xterm2 " make the thing faster
