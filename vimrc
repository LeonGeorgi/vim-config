set shell=bash

call plug#begin('~/.local/share/vim/plugged')

Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'davidhalter/jedi-vim'
Plug 'kana/vim-vspec'
Plug 'iCyMind/NeoSolarized'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-wombat-scheme'
Plug 'tpope/vim-commentary'
Plug 'dag/vim-fish'
Plug 'udalov/kotlin-vim'
Plug 'lilydjwg/colorizer'
Plug 'chriskempson/base16-vim'
Plug 'chunkhang/vim-mbsync'
Plug 'fourjay/vim-password-store'
Plug 'baskerville/vim-sxhkdrc'

call plug#end()

filetype plugin indent on    " required

syntax on


if has("gui_running")
    
    colorscheme wombat
    let g:airline_theme='wombat'
"    set background=light 
"    colorscheme solarized
"    let g:airline_theme='solarized'
"
"    nmap <F2> :ToggleBackground<CR>
else
    colorscheme base16-default-dark
    let base16colorspace=256
    let g:airline_theme='base16'
    set background=light 
endif

set textwidth=80

set expandtab       " expand tabs to spaces
set tabstop=4       " each tab is 4 spaces
set shiftwidth=4    " use 4 spaces for each indent level
set shiftround      " orientate indent on shiftwidth
set hlsearch        " always highlight search results
set incsearch       " search incrementally
set ignorecase      " ignore case when searching
set smartcase       " ignore ignorecase when uppercase letter in search string
set cursorline      " hightlight the current line

set guicursor+=a:blinkon0  " disable blinking cursor

execute "set colorcolumn=" . join(range(81,335), ',')
"set colorcolumn=80

set hidden

" set ruler           " show current line and row number
set scrolloff=3     " lines to show above or below when scrolling
set laststatus=2
set t_Co=256
set relativenumber  " show relative line numbers in gutter
set number          " show absolute line number in current line
set showcmd

highlight clear SignColumn

"set updatetime=100
set ttimeoutlen=30

set wildmenu
set wildignorecase
set wildignore=*.o,*~,*.pyc,*.aux,*.bbl,*.blg,*-blx.bib,*.log,*.out,*.run.xml,
            \*.toc,*.nav,*.snm


let g:jedi#force_py_version=3

let g:airline_powerline_fonts = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FocusLost * redraw!
autocmd VimEnter * redraw!

"hi Normal ctermbg=None

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nmap <F5> :redraw!<CR>
nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

"command! ToggleBackground let &background = ( &background == "dark"? "light" : "dark" )
