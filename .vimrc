syntax on "syntax highlight
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
set fileformats=unix,mac,dos
set background=dark
set textwidth=100
set incsearch
set ignorecase
set smartcase
set laststatus=2

set number
set tabstop=4 "画面上でタブ文字が占める幅
set shiftwidth=4 "自動インデントでずれる幅
set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set noexpandtab
set cursorline "under line
set ruler
set hlsearch

" 用gr实现gT的功能
nnoremap gr :tabprevious<CR>

" for python interface in vim
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python3 % 

" Required:
filetype plugin indent on
syntax enable

" set runtimepath+=$HOME/.vim/mylib
runtime! mylib/*.vim
