" be iMproved, required
set nocompatible
" required
filetype off

" enable utf-8
set encoding=utf-8

" enable folding
set foldmethod=indent

" we dont need no stinking swap files
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" use ruler and tabstop
set ruler
set tabstop=4

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line when writing code
set autoindent

" expand tabs into spaces
set expandtab

" shift lines by 4 spaces
set shiftwidth=4

" show a visual line under ths cursor's current line
set cursorline

" show the matching part of the pair
set showmatch

" enable all Python syntax highlighting
let python_highlight_all = 1
syntax on

" use split right and below
set splitbelow
set splitright

" make backspaces more powerfull
set backspace=indent,eol,start

" search as characters are entered
set incsearch
set hlsearch

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" SimplyFold
Plugin 'tmhedberg/SimpylFold'
" Python Indention
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
" Themes
Plugin 'alessandroyorba/sidonia'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" File Browsing
Plugin 'scrooloose/nerdtree'
" Super Searching
Plugin 'kien/ctrlp.vim'
" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; to update append a bang or call  :PluginUpdate
" :PluginSearch foo - searches for foo; append a bang to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append a bang to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Set theme if gui is running
if has('gui_running')
    set background=dark
    colorscheme sidonia
else
    colorscheme zenburn
endif
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" proper indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Open NERDTree if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Use Ctrl n to open NERDTree
map <C-n> :NERDTreeToggle<CR>
