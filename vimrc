" ----------------------------------------------------------
" Install prettier globally:
" > npm install -g prettier
" or
" > yarn global add prettier
" ----------------------------------------------------------

" For WSL (Windows subsystem for Linux)
" change this path according to your mount point
let s:clip = '/mnt/c/Windows/System32/clip.exe'


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'
" Plugin 'jacoborus/tender.vim'
Plugin 'crusoexia/vim-monokai'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'preservim/nerdtree'
" Plugin 'gcmt/taboo.vim'
Plugin 'prettier/vim-prettier'

" Plugin 'NLKNguyen/papercolor-theme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ============================================================================

set encoding=utf-8
set fileencoding=utf-8
" : set guifont=Monospace:h28
set number
set hlsearch
set incsearch
set ignorecase
set belloff=all
set guioptions-=e
set spell
set list
set showbreak=↪\ 
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set laststatus=2
let g:lightline = { 'colorscheme': 'dracula' }

if (has("termguicolors"))
  set termguicolors
endif

syntax enable
set background=dark
colorscheme dracula

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set fillchars+=vert:\ 
" set fillchars=vert:\│

" === WSL yank support ======================================
"
" Yank whole file with :%y"+

if executable(s:clip)
 augroup WSLYank
   autocmd!
   autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
 augroup END
endif
