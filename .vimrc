execute pathogen#infect()
filetype plugin indent on

" Solarized 
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" Needed for Command-T to work
execute pathogen#helptags()

" Use the comma as the leader
let mapleader=","


Note that Command-T won't overwrite a pre-existing mapping so if you prefer
to define different mappings use lines like these in your |.vimrc|:
" Define different mappings for Command-T
nnoremap <silent> <Leader>f <Plug>(CommandT)
" nnoremap <silent> <Leader>b <Plug>(CommandTBuffer)
" nnoremap <silent> <Leader>j <Plug>(CommandTJump)
