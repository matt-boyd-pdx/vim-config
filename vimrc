set nocompatible

" Setup bundles
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'

" Additional vim config
Bundle 'elliottt/vim-extras'

" External packages
Bundle 'plasticboy/vim-markdown'

" Enable filetype detection
filetype plugin indent on

set ignorecase smartcase

" Allow backspacing over everything
set backspace=indent,eol,start

" Incremental searching
set incsearch

" Allow \ \ to kill the search highlighting.
map <Leader><Leader> :noh<Enter>

" Always show cursor position
set ruler

" Fold by manually defined folds
set foldenable

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

" Highlight undefined, trace and error
let hs_highlight_debug = "true"

" Highlight lines longer than 80 chars
let w:m80=matchadd('ErrorMsg', '\%>80v.\+', -1)
set textwidth=80

" Highlight trailing space, and tab characters
set list lcs=tab:>-,trail:.

" Tab navigation
nmap <C-n> gt
nmap <C-p> gT

" Disable the help key
nmap <F1> <Esc>
imap <F1> <Esc>

" Print options
set printoptions=paper:letter

set wildignore=*.o,*.hi,*.swp,*.bc

" Colors!
colors default
set bg=dark
