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

set background=dark
set colorcolumn=80
set t_ut=  " fix background when using tmux
" colo monokai-soda
let g:zenburn_high_Contrast=1
colo zenburn
set t_ut=  " fix background when using tmux

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
autocmd FileType python setlocal nosmartindent  " fix comment indentation

" Folding

set foldenable
set foldlevelstart=8
set foldnestmax=6

" Keybindings

inoremap jj <ESC>
nnoremap j gj
nnoremap k gk
nnoremap ; :

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

""""""""""
" PLUGINS
""""""""""

execute pathogen#infect()
let g:NERDSpaceDelims = 1

nnoremap <C-o> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

" Lightline
set laststatus=2
set noshowmode
