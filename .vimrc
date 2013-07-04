set nocompatible                                                                                                    
filetype off
call pathogen#incubate()
filetype plugin indent on

set t_Co=256
syntax on

set modelines=0

if has("autocmd")
    " Enable file type detection
    filetype plugin indent on

    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab

    " Customisations based on house-style (arbitrary)
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" update title on exit
"if &term != "builtin_gui"
    "let &titleold=substitute(getcwd(), $HOME,"~",'')
"endif

set fileformat=unix


set encoding=utf-8
set fileencoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1
set termencoding=utf-8
"set termencoding=latin1

" Set behaviour
set hidden
set nowrap                                                         " don't wrap lines
set tabstop=4                                                      " a tab is four spaces
set autoindent                                                     " always set autoindenting on
set copyindent                                                     " copy the previous indentation on autoindenting
set number                                                         " always show line numbers
set shiftwidth=4                                                   " number of spaces to use for autoindenting
set shiftround                                                     " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                                                      " set show matching parenthesis
set softtabstop=4
set tabstop=4
set expandtab                                                      " set spaces instead of tabs
set ignorecase                                                     " ignore case when searching
set smartcase                                                      " ignore case if search pattern is all lowercase,
" case-sensitive otherwise
set smarttab                                                       " insert tabs on the start of a line according to
" shiftwidth, not tabstop
set hlsearch                                                       " highlight search terms
set incsearch                                                      " show search matches as you type

set history=1000                                                   " remember more commands and search history
set undolevels=1000                                                " use many muchos levels of undo
" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set wildignore=*.swp,*.bak,*.pyc,*.un~,*.class
set title                                                          " change the terminal's title

set ofu=syntaxcomplete#Complete                                    " Omnicompletion
set foldmethod=manual                                              " Folding method [manual; indent; expr; marker; syntax; diff]
"set background=dark
"set lines=50                                                       " Default lines (height)
"set columns=120                                                    " Default columns (width)
set scrolloff=3                                                    " Minimal number of screen lines, offset
set showmode                                                       " Shows in which mode i am [normal;insert;visual]
set showcmd                                                        " Show length of selection (visual-mode)
set wildmenu                                                       " Enhanced command-line completion-mode
set wildmode=list:longest
set cursorline                                                     " Highlight current cursor line
set ttyfast                                                        " Fast terminal connection
set ruler                                                          " Cursor position
set backspace=indent,eol,start                                     " Allow backspacing over autoindent, eol and start of insert
set laststatus=2                                                   " Always have a status line [0:never; 1:atleast two windows; 2:always]
" Show Fileencoding in statusline
if has("statusline")
    set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif
set relativenumber                                                 " Relative line numbers
set undofile
set guioptions=erL
" Set invisible characters to show
" set list
set listchars=tab:-\ ,eol:¬
"set listchars=tab:☠\ ,eol:¬
"set listchars=tab:↦\ ,eol:↲ "¬ Ã¶Ã¶hhhii¢
" Custom Mappings
" With a map leader it's possible to do extra key combinations
let mapleader = " "
let g:mapleader = " "

nmap <leader>l :set list!<CR>
map <leader>e :e! $MYVIMRC<CR>

nnoremap j gj
nnoremap k gk

imap jk <Esc>

colorscheme bubblegum
"colorscheme molokai
hi NonText guifg=#393c3d
hi SpecialKey guifg=#393c3d
"
" Set colorscheme to solarized
"colorscheme solarized
"function! SetSolarizedBackground()
"    if strftime("%H") >= 5 && strftime("%H") < 17
"        if &background != 'light'
"            set background=light
"        endif
"    else
"        if &background != 'dark
"            set background=dark
"        endif
"    endif
"endfunction
"
" Every time you save a file, call the function
"if has("autocmd")
"    autocmd bufwritepost * call SetSolarizedBackground()
"endif
