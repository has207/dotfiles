filetype plugin indent on
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
nnoremap <silent> <F6> :NERDTreeToggle<CR>
syntax on
