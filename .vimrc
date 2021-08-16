let skip_defaults_vim=1
set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'pbrisbin/vim-colors-off'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/snippets'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

filetype indent on
syntax enable

let g:mapleader = " "

set termguicolors
set background=dark
colorscheme off
let g:colors_off_a_little=1

let g:coc_global_extensions = ['coc-html-css-support',
                        \ 'coc-tsserver', 'coc-vimlsp',
                        \ 'coc-json', 'coc-git', 'coc-solargraph',
                        \ 'coc-html-css-support', 'coc-fzf-preview']

set number
set termguicolors
set magic
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set cursorline
set nocursorcolumn
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

nnoremap <Esc><Esc> :w<cr>
nnoremap <leader>hl :nohlsearch<CR>

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
nnoremap <silent>gz :e ~/.vimrc<cr>
nnoremap <silent>gZ :so ~/.vimrc<cr>
nnoremap <silent><c-p> :FZF .<cr>

nnoremap <silent> <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden = 0
let NERDTreeDirArrowExpandable=""
let NERDTreeDirArrowCollapsible=""
let NERDTreeMinimalUI=1
let g:NERDTreeGitStatusUseNerdFonts = 1

highlight Visual cterm=reverse ctermbg=NONE

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '40%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'
