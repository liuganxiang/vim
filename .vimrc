"-----------------------------------------------------------
" System
"-----------------------------------------------------------
" make Vim behave in a more useful way
set nocompatible
filetype plugin on
set history=1000
set helplang=en,cn
let mapleader = "\<space>"
" for shell alias command
set shellcmdflag=-ic
" <Shift>k to jump to help for the word under cursor
set keywordprg=:help
" disable 8-bit num
set nrformats-=octal
set timeout timeoutlen=500 ttimeoutlen=-1

"-----------------------------------------------------------
" Appearance
"-----------------------------------------------------------
syntax enable
set ruler
set number
set relativenumber
set hlsearch
set pumheight=10
" Don't display the intro message when launch vim
set shortmess+=I
set showbreak=↳
set wrap
" every wrapped line will continue visually indented
set breakindent
" modeline
set modeline
colorscheme murphy

set cursorline
hi CursorLine cterm=underline ctermfg=13 ctermbg=black
"set cursorcolumn
"hi CursorLine term=underline cterm=none ctermfg=15 ctermbg=DarkGray

"-----------------------------------------------------------
" Key Bindings
"-----------------------------------------------------------
nnoremap <Space>s :source $HOME/.vimrc<CR>

" create new tab
nnoremap <C-n> :tabnew<Space>

" deactivate ZZ
nnoremap ZZ <Nop>
" deactivate ZQ
nnoremap ZQ <Nop>
" deactivate Q
nnoremap Q <Nop>

nnoremap Y y$
" for Japanese IME
nnoremap ：ｗ :w<CR>
nnoremap っｙｐ yyp
nnoremap っｇ gg
nnoremap G G

" <C-u> means delete chars before cursor

nnoremap <ESC><ESC> :nohlsearch<CR>

"-------------------
" Folding
" https://maku77.github.io/vim/advanced/folding.html
set foldmethod=indent
set foldlevel=3
nnoremap fc zc
nnoremap fo zo
nnoremap fA zA
nnoremap fm zm
nnoremap fr zr
nnoremap fM zM
nnoremap fR zR

"-------------------
" Translation
" https://github.com/echuraev/translate-shell.vim
" $ trans -b [en]:zh "Peace begins with a smile."
nnoremap <silent> <Leader>t :Trans<CR>
vnoremap <silent> <Leader>t :Trans<CR>
nnoremap <silent> <Leader>tc :Trans :zh<CR>
vnoremap <silent> <Leader>tc :Trans :zh<CR>

"-------------------
" Moving cursor
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
set scrolloff=5
nnoremap gr :tabprevious<CR>
" to ^
nnoremap <Leader>a ^
" to $
nnoremap <Leader>; $
" コマンドモード時の操作方法
" Ref:http://www.finenc.com/technology/tech_finenet/linux/vim/vim020.html
" 空行を挿入する+α
" Ref:http://deris.hatenablog.jp/entry/20130404/1365086716
nnoremap o :<C-u>for i in range(1, v:count1) \| call append(line('.'), '') \| endfor<CR>j
nnoremap O :<C-u>for i in range(1, v:count1) \| call append(line('.')-1, '') \| endfor<CR>k

"-------------------
" Move between windows
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-l> :wincmd l<CR>

"-------------------
" Exchange windows position
nnoremap <C-t>t <C-w>T
nnoremap <C-j>j <C-w>J
nnoremap <C-h>h <C-w>H
nnoremap <C-l>l <C-w>L

"-------------------
" Bracket pairs
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap """ """<CR><CR><Esc>i"""<Up>
inoremap ``` ```<CR><CR><Esc>i```<Up>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap <> <><Left>
inoremap () ()<Left>

" https://qiita.com/nakabonne/items/84d61ae5e89e20de0157
" latest yank to paste
nnoremap <Leader>p "0p
" change-in-word does not yank (black hole register)
nnoremap <Leader>c "_ciw
" delete-in-word does not yank
nnoremap <Leader>d "_diw
nnoremap <Leader>D "_D

nnoremap <Leader>b :PrevimOpen<CR>

nnoremap <silent> <Leader>hc :setlocal helplang=cn<CR>
nnoremap <silent> <Leader>he :setlocal helplang=en<CR>

" Toggle for netrw
nnoremap <Leader>w :call ToggleNetrw()<CR>

" Toggle for relative number
nnoremap <silent> <Leader>nn :setlocal relativenumber! number!<CR>

" Toggle for cursorline and cursorcolumn
nnoremap <Leader>cc :setlocal cursorcolumn!<CR>
nnoremap <Leader>cl :setlocal cursorline!<CR>

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
" code under the cursor in decimal and hex format
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

"-----------------------------------------------------------
" Tag jumping
"-----------------------------------------------------------
" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

"-----------------------------------------------------------
" File editing
"-----------------------------------------------------------
set backspace=indent,eol,start
set clipboard&
set clipboard^=unnamed,autoselect

"-----------------------------------------------------------
" PlugIns via vim-plug
"-----------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
let g:deoplete#enable_at_startup = 1

Plug 'deoplete-plugins/deoplete-jedi'
Plug 'Shougo/neco-vim'
" Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'previm/previm'
Plug 'dhruvasagar/vim-table-mode'
Plug 'echuraev/translate-shell.vim'
Plug 'yianwillis/vimcdoc'
Plug 'simeji/winresizer'
call plug#end()

"-----------------------------------------------------------
" Autocmd
"-----------------------------------------------------------
autocmd FileType c,php,javascript setlocal commentstring=//\ %s
autocmd FileType apache,shell,py setlocal commentstring=#\ %s
" sw=shiftwidth, sts=softtabstop,ts=tabstop,et=expandtab
autocmd FileType sh         setlocal sw=4 sts=4 ts=4 noet
autocmd FileType go         setlocal sw=4 sts=4 ts=4 noet
autocmd FileType php        setlocal sw=4 sts=4 ts=4 noet
autocmd FileType xml        setlocal sw=4 sts=4 ts=4 noet
autocmd FileType c,c++      setlocal sw=4 sts=4 ts=4 noet
autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
autocmd FileType sql        setlocal sw=2 sts=2 ts=2 et
autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
autocmd FileType json       setlocal sw=2 sts=2 ts=2 et
autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
autocmd FileType markdown   setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et

"-----------------------------------------------------------
" Binary file editing
"-----------------------------------------------------------
" binary (xxd)（vim -b binary file or *.o files etc.)
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

"-----------------------------------------------------------
" Previm (for markdown, plantuml etc.)
"-----------------------------------------------------------
" https://kazuph.hateblo.jp/entry/2016/04/29/211530
let g:previm_open_cmd = 'open -a Safari'
" https://howpon.com/22203
let g:vim_markdown_folding_disabled = 1
let g:previm_enable_realtime = 1

" set runtimepath+=$HOME/.vim/mylib
" runtime! mylib/*.vim

" Set here avoiding reset
set whichwrap=<,>
