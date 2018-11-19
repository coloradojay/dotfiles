" be iMproved, required
set nocompatible

" required
filetype off

" enable utf-8
set encoding=utf-8

" enable folding
set foldmethod=indent

" enable folding
set foldenable

" no mo wrappin
set nowrap

" show all folds
set foldlevel=99

" 10 nested fold max
set foldnestmax=20

" we dont need no stinking swap files
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50

" use ruler and tabstop
set ruler
set tabstop=4
set softtabstop=4

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" set modifibale
set modifiable

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
syntax enable

" use split right and below
set splitbelow
set splitright

" make backspaces more powerfull
set backspace=indent,eol,start

" search as characters are entered
set incsearch
set hlsearch

" set font size for vim and powerline
set guifont=Menlo:h18
set guifont=Inconsolata\ for\ Powerline:h18
let g:Powerline_symbols = 'fancy'
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set colorcolumn=80

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" You Complete Me
Plugin 'Valloric/YouCompleteMe'
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
Plugin 'nvie/vim-flake8'
Plugin 'editorconfig/editorconfig-vim'
" Themes
Plugin 'flazz/vim-colorschemes'
Plugin 'beigebrucewayne/skull-vim'
Plugin 'jakwings/vim-colors'
Plugin 'kristijanhusak/vim-hybrid-material'
" File Browsing
Plugin 'scrooloose/nerdtree'
" Super Searching
Plugin 'kien/ctrlp.vim'
" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" JS/Node Support
Plugin 'moll/vim-node'
Plugin 'pangloss/vim-javascript'
" Tmux Navigation
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'w0rp/ale'
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
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set guifont=SourceCodePro\ for\ Powerline:h18
    endif
    set background=dark
    colorscheme hybrid_material
    set mouse=a
else
    set background=dark
    colorscheme hybrid_material
endif
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" turn off caps lock
inoremap jj <Esc>`^

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" proper indentation
au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=0 |
            \ set expandtab |
            \ set wrapmargin=0 |
            \ set autoindent |
            \ set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css,*.scss
            \ set tabstop=2 |
            \ set softtabstop=2 |
            \ set shiftwidth=2

" Open NERDTree if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Use Ctrl n to open NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" YouCompleteMe Default Auto-Complete
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
map <C-]> :YcmCompleter GoToImprecise<CR>

" CtrlP commands
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" AG for Vim commands
" let g:ackprg = 'ag --nogroup --nocolor --column'
" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
