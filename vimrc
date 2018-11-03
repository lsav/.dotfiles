" Plugins

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'lervag/vimtex'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'  " dependency for deoplete
Plug 'roxma/vim-hug-neovim-rpc'  " dependency for deoplete

call plug#end()

" Basics

set nocompatible
set backspace=indent,eol,start
filetype on
filetype plugin on
syntax enable
syntax on
set number
set hidden
set history=100

let mapleader=","

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Visuals

set background=dark
set colorcolumn=80,100
" colo monokai-soda
let g:zenburn_high_Contrast=1
colo zenburn
set t_ut=  " fix background when using tmux
set listchars=tab:▸\ 

" Indent options

filetype indent on
set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
autocmd FileType tex setlocal ts=2 sw=0 sts=0 noai nosi
" autocmd FileType cpp setlocal ts=2 sw=2 sts=2
autocmd FileType python setlocal nosmartindent  " fix comment indentation
autocmd FileType markdown setlocal wrap linebreak nolist background=dark
autocmd FileType markdown colo pencil

" Folding

set foldenable
set foldlevelstart=8
set foldnestmax=6

" Split pane QOL improvements

set splitbelow
set splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Search tweaks
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <silent> <CR> :nohlsearch<CR><CR>

" Keybindings

inoremap jj <ESC>
nnoremap j gj
nnoremap k gk
nnoremap ; :

""""""""""
" PLUGINS
""""""""""

cs add $CSCOPE_DB

nnoremap <C-o> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

" Lightline
set laststatus=2
set noshowmode

" Haxx to load deoplete asynchronously
let g:deoplete#enable_at_startup = 0
autocmd FileType python,c,cpp call deoplete#enable()

let g:clang_format#style_options={
                    \ "IndentWidth": 4, 
                    \ "SortIncludes": "false"}
