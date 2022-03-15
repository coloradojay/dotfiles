set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set foldmethod=indent
set foldenable
set nowrap
set foldlevel=99
set foldnestmax=20
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set tabstop=4
set softtabstop=4
set number
set ts=4
set modifiable
set autoindent
set expandtab
set shiftwidth=4
set cursorline
set showmatch

let python_highlight_all=1
syntax on

set splitbelow
set splitright

set backspace=indent,eol,start

set incsearch
set hlsearch

set guifont=Menlo:h18
set guifont=Inconsolata\ for\ Powerline:h18
let g:Powerline_symbols='fancy'
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set colorcolumn=80

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'beigebrucewayne/skull-vim'
Plugin 'jakwings/vim-colors'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'moll/vim-node'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'styled-components/vim-styled-components', { 'branch': 'main' }
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-dispatch'
Plugin 'thoughtbot/vim-rspec'
Plugin 'szw/vim-maximizer'
Plugin 'tpope/vim-endwise'
Plugin 'jparise/vim-graphql'
Plugin 'elixir-editors/vim-elixir'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'w0rp/ale'
Plugin 'liuchengxu/space-vim-theme'
Plugin 'prettier/vim-prettier'
Plugin 'hashivim/vim-terraform'
Plugin 'psf/black'

call vundle#end()
filetype plugin indent on

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

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_command = "Dispatch rspec {spec}"

nnoremap jj <Esc>`^

nnoremap <leader><space> :nohlsearch<CR>

au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=0 |
            \ set expandtab |
            \ set wrapmargin=0 |
            \ set autoindent |
            \ set fileformat=unix

au BufNewFile,BufRead *.rb,*.js,*.jsx,*.ts,*.tsx,*.html,*.css,*.scss,*.tf,*.yaml,*.yml
            \ set tabstop=2 |
            \ set softtabstop=2 |
            \ set shiftwidth=2 |
            \ set autoindent

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd BufWritePost *.py call Flake8()

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
map <C-]> :YcmCompleter GoToImprecise<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    let g:ctrlp_use_caching = 0
endif
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

let g:terraform_fmt_on_save=1
let g:terraform_align=1

autocmd BufWritePre *.py execute ':Black'
