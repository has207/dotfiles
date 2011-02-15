filetype plugin indent on
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
nnoremap <silent> <F6> :NERDTreeToggle<CR>
nnoremap <silent> gg g<C-]>
let mapleader = ","
set hidden
set scrolloff=3
set ruler
set shortmess=atI
map H ^
map L $
set noerrorbells
set mousehide
set title
set foldlevel=1
" buffer switching/management, might as well use those keys for something useful
map <Right> :bnext<CR>
imap <Right> <ESC>:bnext<CR>
map <Left> :bprev<CR>
imap <Left> <ESC>:bprev<CR>
" Improve % matching
runtime macros/matchit.vim
syntax on
