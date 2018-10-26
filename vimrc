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
autocmd FileType tex setlocal ts=2 sw=2 sts=2 noai nosi
" autocmd FileType cpp setlocal ts=2 sw=2 sts=2
autocmd FileType python setlocal nosmartindent  " fix comment indentation
autocmd FileType markdown setlocal wrap linebreak nolist background=dark
autocmd FileType markdown colo pencil

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
nnoremap <silent> <CR> :nohlsearch<CR><CR>

""""""""""
" PLUGINS
""""""""""

cs add $CSCOPE_DB

execute pathogen#infect()
let g:NERDSpaceDelims = 1

nnoremap <C-o> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

" Lightline
set laststatus=2
set noshowmode

let g:ycm_complete_in_comments=0
let g:ycm_complete_in_strings=0
let g:ycm_min_num_of_chars_for_completion=3
let g:ycm_max_num_candidates=12
let g:ycm_confirm_extra_conf=0
let g:ycm_python_binary_path="python"

let g:clang_format#style_options={
                    \ "IndentWidth": 4, 
                    \ "SortIncludes": "false"}
