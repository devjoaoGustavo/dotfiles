let skip_defaults_vim=1
set nocompatible

filetype plugin on
filetype indent on

syntax enable

let g:mapleader = " "

set termguicolors
set background=dark

set number
set termguicolors
set magic
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set autoindent
set copyindent
set smartindent
set expandtab
set laststatus=2
set ignorecase
set smartcase
set incsearch
set hlsearch
set nobackup
set nowritebackup
set nrformats=
set path=.,,app/**,domains/**,plugins/**,deprecated_modules/**,modules/**,lib/**,vendor/**
set showcmd
set autoread
set autowrite
set autowriteall
set splitbelow
set splitright
set clipboard+=unnamedplus
set listchars=tab:◁∙▷,trail:∙,precedes:∙,eol:⏎

nmap + mz:m+<cr>`z
nmap - mz:m-2<cr>`z
vmap + :m'>+<cr>`<my`>mzgv`yo`z
vmap - :m'<-2<cr>`>my`<mzgv`yo`z

fun! CleanTrailingSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun
autocmd BufWritePre * :call CleanTrailingSpaces()
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

nnoremap <silent><leader>hl :nohlsearch<CR>
nnoremap <silent><esc><esc> :w<cr>
nnoremap <silent>gz :sp ~/.vimrc<cr>
nnoremap <silent>gZ :so ~/.vimrc<cr>

nnoremap <silent> <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden = 0
let NERDTreeDirArrowExpandable=""
let NERDTreeDirArrowCollapsible=""
let NERDTreeMinimalUI=1

highlight Visual cterm=reverse ctermbg=NONE
