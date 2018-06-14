" Basics

set nocompatible
filetype on
syntax enable
syntax on
set number
set hidden
set history=100

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

" Filetype indent options

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
