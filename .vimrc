""""" Set the comma as the leader
let mapleader=","

""""" Color stuff
" https://stackoverflow.com/questions/33380451/is-there-a-difference-between-syntax-on-and-syntax-enable-in-vimscript
if !exists("g:syntax_on")
  syntax enable
endif

filetype plugin indent on
colorscheme solarized
set background=dark
let g:solarized_termcolors=256

""""" mouse things
set mouse=a
set ttymouse=xterm2 " make the thing faster

""""" NERDTree
" opens with '\', '|' opens current file on NERDTree
nmap \ :NERDTreeToggle<CR>
nmap \| :NERDTreeFind<CR>

""""" ack.vim => Use ag instead of ack
let g:ackprg = 'ag --vimgrep'

""""" General configuration
set nowrap

" Use Ctrl+(h/l) to cycle windows
nmap <silent> <c-h> :tabprevious<CR>
nmap <silent> <c-l> :tabnext<CR>

" Comment stuff out
map <leader>/ gcc

"""""
" https://github.com/mileszs/ack.vim/issues/18
" https://stackoverflow.com/q/13322161/2095714
set shellpipe=>

""""" In insert mode, ctrl+w backspaces over everything
set backspace=indent,eol,start

"""" Command-T
" Wait 25 milliseconds before updating the match list
let g:CommandTInputDebounce = 25

" Define different mappings
map <leader>F :CommandTFlush<CR>:CommandT<CR>
map <leader>f :CommandT<CR>

" Default file scanner, 'ruby' is slow
let g:CommandTFileScanner = "find"

" Copy current file path to system clipboard
map <leader>cp :let @+ = fnamemodify(expand("%"), ":.")<CR>:echo "Copied: ".fnamemodify(expand("%"), ":.")<CR>
map <leader>C :let @+ = fnamemodify(expand("%"), ":.").":".line(".")<CR>:echo "Copied: ".fnamemodify(expand("%"), ":.").":".line(".")<CR>

" Highlight search matches (*)
set hlsearch

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

let NERDTreeRespectWildIgnore = 1
let NERDTreeShowHidden = 1

" Save
map <leader>w :w<CR>

" reload .vimrc
map <leader>v :source ~/.vimrc<CR>

" Git blame
map <leader>g :Git blame<CR>

" Enable ruler
set ruler

set tabstop=2
set expandtab
set autoindent
set breakindent
set smarttab
set shiftwidth=2
set smartcase
set ignorecase
" Enable line numbers
set number

set splitright
set splitbelow
set scrolloff=3

" utf-8 encoding
set encoding=utf-8

set list        " Show whitespace
set listchars=trail:·,tab:>-

set autoread

" Remove swap and backup files from your working directory
" https://vim.fandom.com/wiki/Remove_swap_and_backup_files_from_your_working_directory
set backupdir=$TMPDIR
set directory=$TMPDIR

" Disabling for now, makes vim super slow
" set cursorline

" spellcheck for git commits
autocmd FileType gitcommit setlocal spell spelllang=en_us

" Built in matchit macro allows '%' to work well with Ruby code
" Works with at least Vim 7.4
runtime macros/matchit.vim

" In command-line mode, <C-A> should go to the front of the line, as in bash.
cmap <C-A> <C-B>

" show matches while typing the pattern
set incsearch

" Try different regexp engine
set regexpengine=1

" without this the mouse doesn't work past the 220th column
" https://stackoverflow.com/a/19253251/2095714
" set ttymouse=sgr

" Pull current line down
nmap <C-J> i<CR><ESC>

" Indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

function! StripTrailingWhitespace()
  mark a
  %s/\s\+$//e
  'a
endfunction

autocmd BufWritePre *.rb,*.yml,*.js,*.jsx,*.css,*.less,*.sass,*.scss,*.html,*.xml,*.erb,*.haml,*.sh,Dockerfile*,*.rake,*.hbs call StripTrailingWhitespace()

" Faster scrolling
nnoremap <C-e>  3<C-e>
nnoremap <C-y>  3<C-y>

" Change cursor in insert/normal mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
end

autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
autocmd BufNewFile,BufRead Dockerfile* set syntax=dockerfile
