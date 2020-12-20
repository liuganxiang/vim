" ファイル名表示
set statusline=%t
" 変更チェック表示
set statusline+=%m
" spaceを入れる
set statusline+=\ \ 
" fileformatとfiletypeの表示
set statusline+=(%{&ff}/%Y)
set statusline+=\ \ 
" file encoding
set statusline+=[%{&fileencoding}]
" これ以降は右寄せ表示
set statusline+=%=
" 現在の位置を表示
set statusline+=(%l,%c)
set statusline+=\ \ 
" カーソル下の文字コードを10進数と16進数で表示
set statusline+=%b\ 0x%02B
set statusline+=\ \ 
" テキスト全体に対するカーソル位置までの割合/全行数
set statusline+=[%p%%/%L]
