setlocal autoindent
setlocal nocindent
setlocal expandtab

highlight hsComment term=NONE ctermfg=cyan

nnoremap <buffer> K <Nop>
vnoremap <buffer> K <Nop>

" Insert a separating line
nnoremap <buffer> <LocalLeader>l ^80i-<Esc>^llR<Space>

" Insert a Haddock comment
nnoremap <buffer> --\| O--<Space>\|<Space>

" Pragmas
nnoremap <buffer> <localleader>#l O{-# LANGUAGE  #-}<Esc>hhhi
nnoremap <buffer> <localleader>#i O{-# INLINE  #-}<Esc>hhhi

" Insert an import declaration
nnoremap <buffer> <localleader>i Oimport 

" Reload in ghci in a separate tmux pane
nnoremap <buffer> <silent> <localleader>r :call VimuxRunCommand(':r')<Cr>

" Set the tab size
setlocal tabstop=8
setlocal shiftwidth=2

" Setup ghc-mod based omni-completion
setlocal omnifunc=necoghc#omnifunc

" Spellcheck comments
setlocal spell

" Configure :make
if haskell#CabalFileExists()
    compiler cabal-build
endif

" Setup include and includeexpr
call haskell#FollowImports()
