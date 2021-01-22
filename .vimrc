" Ref:https://github.com/ssh0/dotfiles/blob/master/vimfiles/vimrc
"-----------------------------------------------------------
" System
"-----------------------------------------------------------
"{{{
" make Vim behave in a more useful way
set nocompatible
filetype plugin on
" deactivate ZZ
nnoremap ZZ <Nop>
" deactivate ZQ
nnoremap ZQ <Nop>
" deactivate Q
nnoremap Q <Nop>
set history=1000
set helplang=en,cn
nnoremap <Space>r :source $HOME/.vimrc<CR>
let mapleader = "\<space>"
" Save
nnoremap <Leader>s :w<CR>
"}}}

"-----------------------------------------------------------
" Appearance
"-----------------------------------------------------------
"syntax on
syntax enable
" Show the line and column number of the cursor position
set ruler
" Precede each line with its line number
set number
set hlsearch
set cursorline
set pumheight=10
set relativenumber
set background=dark
" Don't display the intro message when start vim
set shortmess+=I
set showbreak=↳
set wrap
" every wrapped line will continue visually indented
set breakindent
" modeline
set modeline

"-----------------------------------------------------------
" Folding
" https://maku77.github.io/vim/advanced/folding.html
"-----------------------------------------------------------
set foldmethod=indent
set foldlevel=3
nnoremap fc zc
nnoremap fo zo
nnoremap fA zA
nnoremap fm zm
nnoremap fr zr
nnoremap fM zM
nnoremap fR zR

"-----------------------------------------------------------
" Status line
"-----------------------------------------------------------
" absolute path
set statusline=%F " %t is basename
" whether changed
set statusline+=%m
" insert space
set statusline+=\ \ 
" fileformat and filetype
set statusline+=(%{&ff}/%Y)
set statusline+=\ \ 
" file encoding
set statusline+=[%{&fileencoding}]
" right-justified display after this
set statusline+=%=
" current positon
set statusline+=(%l,%c)
" insert space
set statusline+=\ \ 
" code under the cursor in decimal and hexadecimal format
set statusline+=%b\ 0x%02B
" insert space
set statusline+=\ \ 
" % of the entire text to the cursor position / total lines
set statusline+=[%p%%/%L]

"-----------------------------------------------------------
" Encoding
"-----------------------------------------------------------
set encoding=utf-8
set fileformats=unix,mac,dos
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

"-----------------------------------------------------------
" Tab / Space Width
"-----------------------------------------------------------
" Enable indentation
set autoindent
" Allow Tab to be inserted
set noexpandtab
" Number of blanks the Tab supports
set tabstop=4
" Number of blanks used for indentation
set shiftwidth=4
" Number of blanks Tab corresponds to when a Tab insertion
set softtabstop=4
" Maximum width of text being entered(0 is no limited)
set textwidth=0

"-----------------------------------------------------------
" Search
"-----------------------------------------------------------
set incsearch
" Search patterns are not case sensitive
set ignorecase
" If the search pattern contains uppercase letters, 
" search separately
set smartcase
" Always display status line
set laststatus=2
" Searches wrap around the end of the file
set wrapscan
" When a bracket is inserted, jump to the matching one
set showmatch matchtime=1
nnoremap <ESC><ESC> :nohlsearch<CR>

"-----------------------------------------------------------
" Translation
" Ref:https://github.com/echuraev/translate-shell.vim
" $ trans -b -s=en -t=zh "Peace begins with a smile."
"-----------------------------------------------------------
nnoremap <silent> <leader>t :Trans<CR>
vnoremap <silent> <leader>t :Trans<CR>
nnoremap <silent> <leader>tc :Trans :zh<CR>
vnoremap <silent> <leader>tc :Trans :zh<CR>

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
" Finding files
"-----------------------------------------------------------
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

"-----------------------------------------------------------
" File browsing
"-----------------------------------------------------------
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab

"-----------------------------------------------------------
" Tag jumping
"-----------------------------------------------------------
" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

"-----------------------------------------------------------
" Editing
"-----------------------------------------------------------
nnoremap Y y$
set backspace=indent,eol,start
set clipboard&
set clipboard^=unnamed,autoselect

" Ref:https://qiita.com/nakabonne/items/84d61ae5e89e20de0157
" latest yank to paste
nnoremap <Leader>p "0p
" change-in-word does not yank
nnoremap <Leader>c "_ciw
" delete-in-word does not yank (black hole register)
nnoremap <Leader>d "_diw

"-----------------------------------------------------------
" PlugIns via vim-plug
"-----------------------------------------------------------
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
Plug 'echuraev/translate-shell.vim'
" Chinese doc(https://github.com/wsdjeg/vimdoc-cn)
Plug 'yianwillis/vimcdoc'
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
