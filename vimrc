" ----------------------------------------------------------
" Install Vundle:
"
" On Linux / Git Bash on Windows:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" ----------------------------------------------------------
" Install prettier globally:
"
" > npm install -g prettier
" or
" > yarn global add prettier
" ----------------------------------------------------------
"
" ----------------------------------------------------------


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
Plugin 'jacoborus/tender.vim'
Plugin 'crusoexia/vim-monokai', { 'name': 'monokai' }
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'joshdick/onedark.vim'
Plugin 'morhetz/gruvbox'
Plugin 'preservim/nerdtree'
Plugin 'prettier/vim-prettier'
Plugin 'voldikss/vim-floaterm'
" Plugin 'mengelbrecht/lightline-bufferline'

" Plugin 'NLKNguyen/papercolor-theme'
Plugin 'mhinz/vim-startify'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

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

set mouse=a
set noswapfile
set scrolloff=8
set sidescrolloff=8
let $LANG = 'en_US'
set encoding=utf-8
set fileencoding=utf-8
set guifont=Lucida_Console:h18
set guioptions-=m " removes menu bar
set guioptions-=T " removes toolbar
set guioptions-=r " removes scrollbar
set number
" set relativenumber
set expandtab
set shiftwidth=2
set signcolumn=auto
set tabstop=2
set hidden
set hlsearch
set incsearch
set ignorecase
set belloff=all
set guioptions-=e
set nowrap
set spell
set list
" set showbreak=↪\ 
" set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

set listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:←


set confirm
set splitright
set splitbelow
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=number


" set shell=\"C:\Program\ Files\Git\git-bash.exe\"

if has("win32")
  au GUIEnter * simalt ~x
  " set shell=C:\Windows\Sysnative\wsl.exe
  set shell=\"C:\Program\ Files\Git\bin\bash.exe\"
  set shellpipe=|
  set shellredir=>
  set shellcmdflag=
endif

" reselect visual selection after identing
vnoremap < <gv
vnoremap > >gv

" copy/paste etc
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+


" set nojoinspaces

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

if (has("termguicolors"))
  set termguicolors
endif

syntax enable
set background=dark


augroup colors
  autocmd!
  autocmd ColorScheme * call s:modifyOneDarkTheme()
augroup END


function s:modifyOneDarkTheme()
  if g:colors_name == "onedark"
    let s:background = { "gui": "#101010", "cterm": "235", "cterm16": "0", "cterm256": "0" }

    call onedark#set_highlight("Normal", { "bg": s:background })
  endif
endfunction

let g:gruvbox_contrast_dark = 'hard'
colorscheme tender

set laststatus=2
" let g:lightline = { 'colorscheme': 'onedark' }


" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set fillchars+=vert:\ 
" set fillchars=vert:\│


let g:prettier#config#tab_width = '2'
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true' 
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" configure netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

augroup ProjectDrawer
  autocmd!
  " autocmd VimEnter * :Vexplore
augroup END

let g:lightline = {
      \ 'colorscheme': g:colors_name,
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

" startify configuration
let g:startify_files_number = 8
let g:startify_custom_header = ''

let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

inoremap <silent><expr> <c-space> coc#refresh()
