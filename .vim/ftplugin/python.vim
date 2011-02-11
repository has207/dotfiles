setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=80
setlocal smarttab
setlocal expandtab
setlocal smartindent
setlocal autoindent
setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
setlocal number
compiler pyunit
nmap <F5> <Esc>:!python %<CR>
