" Basics

set nocompatible
filetype on
filetype plugin on
syntax enable
syntax on
set number
set hidden
set history=100
let mapleader=","

" Visuals

" set lines=40 columns=100
set colorcolumn=80
colo monokai-soda

" Indent options

filetype indent on
set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
autocmd FileType tex setlocal ts=2 sw=2 sts=2 colorcolumn=90 noai nosi
autocmd FileType cpp setlocal ts=2 sw=2 sts=2 colorcolumn=80

" Folding

set foldenable
set foldlevelstart=8
set foldnestmax=6

" Keybindings

inoremap jj <ESC>
nnoremap j gj
nnoremap k gk
nnoremap ; :
nnoremap <leader>vs <C-w>v<C-w>l

" Search tweaks
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Plugins
execute pathogen#infect()
let g:NERDSpaceDelims = 1

nnoremap <leader>tree :NERDTree<CR>
let NERDTreeQuitOnOpen = 1

cs add $HOME/Dropbox/cpen331/os161/.tags/cscope.out
