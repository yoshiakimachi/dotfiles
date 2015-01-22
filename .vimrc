"============================
" NeoBundle Setting
"============================
"
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Let NeoBundle manage NeoBundle
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

" add plugins
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/unite.vim'

filetype plugin on

NeoBundleCheck

"============================
" Basic Settings
"============================

syntax on
set encoding=utf8
set fileencoding=utf-8
set noswapfile
set backspace=indent,eol,start
set number
set ruler
set infercase
set background=dark
set history=2000
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

