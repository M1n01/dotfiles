"dein Scripts-------------------------:
if &compatible
  set nocompatible               " Be improved
endif

" Required:
set runtimepath+=/Users/abeminato/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/abeminato/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('/Users/abeminato/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

call dein#add('42Paris/42header')
call dein#add("cohama/lexima.vim")

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

"If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------:

let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦'

"----------------------------------------
" 検索
"----------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch

"----------------------------------------
" 表示設定
"----------------------------------------
" シンタックスハイライト
syntax on
" 行番号の表示
set number
" タイトルを表示
set title
set guioptions+=R
set shiftwidth=4
set hlsearch
set autoindent
set ruler
set showmatch
set cursorline
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
set listchars=tab:>_,trail:~,extends:>,precedes:<
" ファイル内にあるタブ文字の表示幅
set tabstop=4
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
