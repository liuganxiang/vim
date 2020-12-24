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
set relativenumber

set number
set tabstop=4 "画面上でタブ文字が占める幅
set shiftwidth=4 "自動インデントでずれる幅
set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set noexpandtab
set cursorline "under line
set ruler
set hlsearch
" copy yank to clipboard
set clipboard+=unnamed

" 用gr实现gT的功能
nnoremap gr :tabprevious<CR>
" reload .vimrc
nnoremap <Space>s :source $HOME/.vimrc<CR>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" deactivate ZZ
nnoremap ZZ <Nop>
" deactivate ZQ
nnoremap ZQ <Nop>
" deactivate Q
nnoremap Q <Nop>

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
let g:deoplete#enable_at_startup = 1

Plug 'deoplete-plugins/deoplete-jedi'
Plug 'Shougo/neco-vim'
call plug#end()

" set runtimepath+=$HOME/.vim/mylib
runtime! mylib/*.vim

" for commentary.vim
autocmd FileType c,php,javascript setlocal commentstring=//\ %s
autocmd FileType apache,shell,py setlocal commentstring=#\ %s

" bind space to Leader
let mapleader = "\<space>"
" mapping to ^
nnoremap <Leader>a ^
" mapping to $
nnoremap <Leader>; $
" for NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

