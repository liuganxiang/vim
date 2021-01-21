"-----------------------------------------------------------
" System
"-----------------------------------------------------------
"{{{
" deactivate ZZ
nnoremap ZZ <Nop>
" deactivate ZQ
nnoremap ZQ <Nop>
" deactivate Q
nnoremap Q <Nop>
set history=1000
nnoremap <Space>r :source $HOME/.vimrc<CR>
let mapleader = "\<space>"
" save
nnoremap <Leader>s :w<CR>
"}}}

"-----------------------------------------------------------
" Appearance
"-----------------------------------------------------------
syntax on
set ruler
set number
set hlsearch
set cursorline
set pumheight=10
set relativenumber
set background=dark

"-----------------------------------------------------------
" Encoding
"-----------------------------------------------------------
set encoding=utf-8
set fileformats=unix,mac,dos
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp

"-----------------------------------------------------------
" Tab / Space Width
"-----------------------------------------------------------
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=100

"-----------------------------------------------------------
" Search
"-----------------------------------------------------------
set incsearch
set ignorecase
set smartcase
set laststatus=2
nnoremap <ESC><ESC> :nohlsearch<CR>

"-----------------------------------------------------------
" Moving cursor
"-----------------------------------------------------------
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
set scrolloff=3
nnoremap gr :tabprevious<CR>
" mapping to ^
nnoremap <Leader>a ^
" mapping to $
nnoremap <Leader>; $

"-----------------------------------------------------------
" Exchange windows position
"-----------------------------------------------------------
nnoremap <C-t>t <C-w>T
nnoremap <C-j>j <C-w>J
nnoremap <C-h>h <C-w>H
nnoremap <C-l>l <C-w>L

"-----------------------------------------------------------
" Editing
"-----------------------------------------------------------
nnoremap Y y$
set backspace=indent,eol,start
set clipboard+=unnamed,autoselect

" Ref:https://qiita.com/nakabonne/items/84d61ae5e89e20de0157
" latest yank to paste
nnoremap <Leader>p "0p
" change-in-word does not yank
nnoremap <Leader>c "_ciw
" delete-in-word does not yank (black hole register)
nnoremap <Leader>d "_diw

call plug#begin('~/.vim/plugged')
" Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
let g:deoplete#enable_at_startup = 1

Plug 'deoplete-plugins/deoplete-jedi'
Plug 'Shougo/neco-vim'
Plug 'jiangmiao/auto-pairs'
" Vim + PlantUML = Sequence Diagram of UML
"Plug 'aklt/plantuml-syntax'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'previm/previm'
Plug 'dhruvasagar/vim-table-mode'
call plug#end()

" for commentary.vim
autocmd FileType c,php,javascript setlocal commentstring=//\ %s
autocmd FileType apache,shell,py setlocal commentstring=#\ %s


" ref:https://issueoverflow.com/2019/11/22/set-vim-netrw-like-nerdtree/
" ref:https://pc.oreda.net/software/filer/netrw
"Netrwをtoggleする関数
let g:NetrwIsOpen=0
function! ToggleNetrw()
  if g:NetrwIsOpen
    let i = bufnr("$")
    while (i >= 1)
      if (getbufvar(i, "&filetype") == "netrw")
        silent exe "bwipeout " . i
      endif
      let i-=1
    endwhile
    let g:NetrwIsOpen=0
  else
  let g:NetrwIsOpen=1
  silent Vex
endif
endfunction
nnoremap <Leader>n :call ToggleNetrw()<CR>

" binary (xxd)（vim -b binary file or  *.o files etc.)
augroup Binary
  autocmd!
  autocmd BufReadPre  *.o,*.a,*.out let &binary = 1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r
  autocmd BufWritePre * endif
  autocmd BufWritePost * if &binary | silent %!xxd
  autocmd BufWritePost * set nomod | endif
augroup END

" zip and unzip
let g:zip_unzipcmd = "unzip"
let g:zip_zipcmd = "zip"

" Ref:https://kazuph.hateblo.jp/entry/2016/04/29/211530
let g:previm_open_cmd = 'open -a Safari'
nnoremap <Leader>b :PrevimOpen<CR>
" Ref:https://howpon.com/22203
let g:vim_markdown_folding_disabled = 1
let g:previm_enable_realtime = 1

" set runtimepath+=$HOME/.vim/mylib
runtime! mylib/*.vim

" Set here avoiding reset
set whichwrap=<,>
