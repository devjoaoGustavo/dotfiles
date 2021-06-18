let skip_defaults_vim=1
set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'jremmen/vim-ripgrep'
Plug 'pangloss/vim-javascript'
Plug 'sainnhe/gruvbox-material'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'wakatime/vim-wakatime'
Plug 'airblade/vim-rooter'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'hashivim/vim-terraform'
Plug 'pseewald/vim-anyfold'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chrisbra/csv.vim'
Plug 'ajmwagar/vim-deus'
Plug 'zefei/simple-dark'
call plug#end()

packadd! matchit

set history=500

filetype plugin on
filetype indent on

set autoread
syntax on

autocmd Filetype * AnyFoldActivate
let g:anyfold_fold_comments=1
set foldlevel=10
hi Folded term=NONE cterm=NONE
set foldcolumn=0

let mapleader = " "
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

command! Maketags !ctags -R .

set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

set clipboard=unnamedplus

set showtabline=2
set ruler

set cmdheight=1

set hidden
set ignorecase
set smartcase
set hlsearch
set incsearch

set lazyredraw

set magic

set showmatch

set noerrorbells
set novisualbell
set t_vb=
set ttimeout timeoutlen=500

syntax enable

" let g:gruvbox_material_sign_column_background = 'none'
" let g:gruvbox_material_show_eob = 0

set scrolloff=10

set t_Co=256
set termguicolors
set background=dark
" let g:jellybeans_use_term_italics = 1
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:deus_termcolors=256
colorscheme simple-dark

set encoding=utf-8

set nobackup
set nowritebackup
set noswapfile

set expandtab
set smarttab

map <space>/ :Rg<space>

nnoremap <esc><esc> :w<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" set laststatus=2
set statusline="%{FugitiveStatusline()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c"
" set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'

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
set path+=**
" set path+=.,,app/**,domains/**,plugins/**,deprecated_modules/**,modules/**,lib/**,vendor/**
set number
set showcmd
set listchars=tab:◁∙▷,trail:∙,precedes:∙,eol:⏎
set wildmenu
set wildmode=list:full
set nowrap

set autoread
set autowrite
set autowriteall

set ttimeout timeoutlen=500

nnoremap <silent> gs :Git<cr>
nnoremap <silent> gb :G blame<cr>
nnoremap <silent> gz :e ~/.vimrc<cr>
nnoremap <silent> gZ :so ~/.vimrc<cr>
nnoremap <silent> <leader><leader> <C-^>
nnoremap <silent> gy :let @+ = expand("%")<cr>
nnoremap <silent> <leader>m :set invlist<cr>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>te :tabe %<cr>
nnoremap <silent> <leader>hl :nohl<CR>

let NERDTreeShowHidden = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = []
let NERDTreeStatusline = ''
let NERDTreeIgnore=['\.pyc$', '\~$']
let g:NERDTreeMapCustomOpen = 'l'
let g:NERDTreeMapCloseDir = 'h'

let g:terraform_fmt_on_save=1
let g:terraform_binary_path="/home/JOAO.GUSTAVO/.asdf/shims/terraform"
let g:Lf_ShortcutF = '<C-p>'

let g:ale_set_highlights=0
let g:ale_set_signs=0

"==============================================================================
" closepairs.vim - Auto closes pairs of characters
"==============================================================================
"
" Author:   NoWhereMan (Edoardo Vacchi) <uncommonnonsense at gmail dot com>
" Version:  0.1
" URL: 	    http://www.flatpress.org/
" License:  Public Domain
"==============================================================================

inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>

vnoremap <leader>" "zdi"<c-r>z"
vnoremap <leader>' "zdi'<c-r>z'
vnoremap <leader>( "zdi(<c-r>z)
vnoremap <leader>[ "zdi[<c-r>z]
vnoremap <leader>{ "zdi{<c-r>z}

inoremap <expr> <bs> <SID>delpair()

inoremap <expr> ) <SID>escapepair(')')
inoremap <expr> } <SID>escapepair('}')
inoremap <expr> ] <SID>escapepair(']')

inoremap <expr> " <SID>pairquotes('"')
inoremap <expr> ' <SID>pairquotes("'")

function! s:delpair()
  let l:lst = ['""',"''",'{}','[]','()']
  let l:col = col('.')
  let l:line = getline('.')
  let l:chr = l:line[l:col-2 : l:col-1]
  if index(l:lst, l:chr) > -1
    return "\<bs>\<del>"
  else
    let l:chr = l:line[l:col-3:l:col-2]
    if (index(l:lst, l:chr)) > - 1
      return "\<bs>\<bs>"
    endif
    return "\<bs>"
  endif
endf

function! s:escapepair(right)
  let l:col = col('.')
  let l:chr = getline('.')[l:col-1]
  if a:right == l:chr
    return "\<right>"
  else
    return a:right
  endif
endf

function! s:pairquotes(pair)
  let l:col = col('.')
  let l:line = getline('.')
  let l:chr = l:line[l:col-1]
  if a:pair == l:chr
    return "\<right>"
  else
    return a:pair.a:pair."\<left>"
  endif
endf
