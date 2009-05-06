setlocal shiftwidth=2
setlocal tabstop=2
setlocal autoindent
setlocal nocindent
setlocal expandtab

setlocal include=^import
setlocal includeexpr=substitute(substitute(v:fname,'\\.','/','g'),'$','.hs','')

highlight hsComment term=NONE ctermfg=cyan
