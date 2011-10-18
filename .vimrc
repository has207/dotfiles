filetype plugin indent on
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
nnoremap <silent> <F6> :NERDTreeToggle<CR>
nnoremap <silent> gg g<C-]>
let g:NERDTreeIgnore = ['\~$', '\.pyc$']
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
" Improve % matching
runtime macros/matchit.vim
syntax on

" open file, from the current vim dir
noremap ,o :FufFile<CR> 

" select one of the loaded buffers 
noremap ,v :FufBuffer<CR> 

" open file, from the dir the current file lives into 
noremap ,a :FufFileWithCurrentBufferDir<CR> 

" jump to line 
noremap ,j :FufLine<CR>

" this lets you type r: and get in your list of files all the files in 
" the actual dir and its subdirs 
let g:fuf_abbrevMap = { 
      \   "^r:" : [ 
      \     './**/', 
      \   ]
      \ } 
