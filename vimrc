let mapleader      = ","
let maplocalleader = ";"

runtime env.vim
runtime plugins.vim

runtime site-config.vim

set ignorecase smartcase

" Allow backspacing over everything
set backspace=indent,eol,start

" Incremental searching
set incsearch

" Extended matching with %
runtime macros/matchit.vim

" Set the terminal title
set title

" Cursor context
set scrolloff=3

" Allow \ \ to kill the search highlighting.
nnoremap <silent> <Leader><Leader> :noh<Enter>

" Always show cursor position
set ruler

" Tab/buffer navigation
function! Next()
    if tabpagenr('$') > 1
        tabnext
    else
        bnext
    endif
endfunction

function! Prev()
    if tabpagenr('$') > 1
        tabprevious
    else
        bprevious
    endif
endfunction

nnoremap <silent> <C-n> :call Next()<Cr>
nnoremap <silent> <C-p> :call Prev()<Cr>
nnoremap <silent> <C-d> :Sayonara<Cr>

" Fold by manually defined folds
set foldenable
set foldmethod=marker

" Syntax
if &t_Co > 2 || has("gui_running")
    syntax enable
    set hlsearch
endif

" Spell checking
if has("spell")
    setlocal spell spelllang=en_us
    set nospell
endif

" Highlight lines longer than 80 chars
let w:m80=matchadd('ErrorMsg', '\%>80v.\+', -1)

" Wrap the line at 80 characters
set textwidth=80

" Highlight trailing space, and tab characters, toggle with <leader>-s
set list lcs=tab:>-,trail:.
nnoremap <leader>s :set nolist!<CR>

" Disable the help key
nnoremap <F1> <Esc>
inoremap <F1> <Esc>

" Print options
set printoptions=paper:letter

" Completion options
set wildmode=longest:full,list:full
set wildmenu
set wildignore+=*.o,*.hi,*.swp,*.bc,dist/*

" Colors!
" let g:seoul256_background = 239
" colors seoul256
colors zenburn
set background=dark

" Disable the arrow keys when in edit mode
inoremap <Up>    <NOP>
inoremap <Right> <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>

" Navigate through quickfix errors
nnoremap <silent> [q :cprev<Return>
nnoremap <silent> ]q :cnext<Return>

" Stop entering ex mode accidentally
nnoremap Q <NOP>

inoremap jk <Esc>

" Use F3 to toggle spelling
nnoremap <F3> :set spell!<CR>

" Disable the bell
set noeb t_vb=

" Map <Leader>s to sort the visual selection
vnoremap <Leader>s :sort<Cr>

" Case altering
nnoremap <Leader>U viwgU
nnoremap <Leader>u viwgu

" Swap files in one place
set directory=$VIMHOME/swap

" Fix a bug with tmux-2.3 and vim-dispatch (note the trailing space)
"
" https://github.com/tpope/vim-dispatch/issues/192
set shellpipe=2>&1\|\ tee\ 

" Enable hidden buffers (so that switching between dirty buffers doesn't throw
" an error)
set hidden

" Automatically restore the last position on reload
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   execute "normal! g'\"" |
\ endif

function FindPat(...) abort
    let l:pat = "'" . join(a:000, '\s+') . "'"

    let l:makeprg_bak     = &makeprg
    let l:errorformat_bak = &errorformat

    try
        let &l:makeprg     = 'ag --vimgrep -- ' . l:pat
        let &l:errorformat = "%f:%l:%c:%m"
        Make

    finally

        let &l:makeprg     = l:makeprg_bak
        let &l:errorformat = l:errorformat_bak
    endtry
endfunction

command -nargs=* Find call FindPat(<f-args>)
command -nargs=0 Todo call FindPat('TODO\|XXX')

" Grep for the word under the cursor
nnoremap <silent> <Leader>f yiw:Find '<C-r>"'<Cr>
