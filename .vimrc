call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'fatih/vim-go'
Plug 'jiangmiao/auto-pairs'
Plug 'jremmen/vim-ripgrep'
Plug 'kien/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'NLKNguyen/papercolor-theme'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'wakatime/vim-wakatime'
Plug 'airblade/vim-rooter'
Plug 'jlanzarotta/bufexplorer'
call plug#end()

set history=500

filetype plugin on
filetype indent on

set autoread
syntax on

let mapleader = " "
nnoremap <leader>w :w<cr>
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

set ruler

set cmdheight=1

set hid

set ignorecase
set smartcase
set hlsearch
set incsearch

set lazyredraw

set magic

set showmatch

set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set foldcolumn=1

syntax enable4

set t_Co=256
colorscheme gruvbox-material
set background=dark

set encoding=utf-8

set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

set expandtab
set smarttab

map <space><space> :Rg<space>

nnoremap <silent> <leader><cr> :nohl<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

set laststatus=2
set statusline="\ %{FugitiveStatusline()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c"

nmap + mz:m+<cr>`z
nmap - mz:m-2<cr>`z
vmap + :m'>+<cr>`<my`>mzgv`yo`z
vmap - :m'<-2<cr>`>my`<mzgv`yo`z

fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

if has("autocmd")
  autocmd BufWritePre * :call CleanExtraSpaces()
endif

map <leader>ss :setlocal spell!<cr>

set splitbelow
set splitright
set shiftwidth=2
set softtabstop=2
set shortmess+=cS
set nrformats=
set path=.,,app/**,domains/**,plugins/**,deprecated_modules/**,modules/**,lib/**,vendor/**
set number
set wildmenu
set showcmd
set listchars=tab:◁∙▷,trail:∙,precedes:∙,eol:⏎
set wildmode=full

nnoremap gs :Git<cr>
nnoremap <leader>fed :e ~/.vimrc<cr>
nnoremap <leader>fer :so ~/.vimrc<cr>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>cf :let @+ = expand("%")<cr>
nnoremap <leader>m :set invlist<cr>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>te :tabe %<cr>
