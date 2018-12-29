let g:python_host_prog='/Users/karasawa/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog='/Users/karasawa/.pyenv/versions/neovim3/bin/python'
"let g:loaded_python3_provider=1

set t_Co=256
set laststatus=2
set showtabline=2
set noshowmode

"basic
set nocompatible
set encoding=utf-8
set fenc=utf-8
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set wrap
set number
set ruler
set clipboard+=unnamed  ",autoselect
set directory=~/.vim/backupfiles
set backupdir=~/.vim/backupfiles
set undodir=~/.vim/backupfiles
set writebackup
set list                    " 不可視文字の可視化
set hlsearch
set incsearch
set undofile
set scrolloff=5
set cursorline
set showmatch
set matchtime=1             " 対応括弧のハイライト表示秒数
set infercase               " 補完時に大文字小文字を区別しない
set colorcolumn=80          " 80行目にラインを入れる
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲  " 不可視文字を代替
set fileencodings=utf-8,sjs,default,
set foldmethod=indent

filetype plugin indent on

autocmd BufRead,BufNewFile *.slim setfiletype slim

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#load_toml('~/.config/nvim/dein.toml', { 'lazy': 0 })
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', { 'lazy': 1 })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"tyru/caw.vim
nmap <Leader>c <Plug>(caw:i:toggle)     " gicでコメントアウト \cでコメント
vmap <Leader>c <Plug>(caw:i:toggle)     " giaで行末コメント追記 \cでコメント解除

" NERDTree
let NERDTreeShowHidden=1
" indentLine
let g:indentLine_faster = 1
let g:indentLine_color_term = 239

" color scheme
syntax on
colorscheme molokai

" neadtree
autocmd VimEnter * NERDTree
"How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" fzf
set rtp+=/usr/local/opt/fzf
nmap ; :Buffers<Enter>
nmap ,f :Files<Enter>
nmap ,t :Tags<Enter>

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

nmap ,a :Ag<Enter>
