let skip_defaults_vim=1
filetype off
set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/nerdtree'
Plug 'wakatime/vim-wakatime'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'nelstrom/vim-mac-classic-theme'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

filetype plugin on
filetype indent on
syntax enable

let &term="xterm-256color"

let g:mapleader = " "

set termguicolors
set background=light
colorscheme mac_classic

let g:coc_global_extensions = ['coc-html-css-support',
                        \ 'coc-tsserver', 'coc-vimlsp',
                        \ 'coc-json', 'coc-git', 'coc-solargraph',
                        \ 'coc-html-css-support', 'coc-fzf-preview']

set magic
set mouse=a
set number
set termguicolors
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set nocursorline
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
set path=.,,app-*/**,app/**,domains/**,plugins/**,deprecated_modules/**,modules/**,lib/**,vendor/**
set showcmd
set autoread
set autowrite
set autowriteall
set splitbelow
set splitright
set clipboard=unnamedplus
set wildmenu
set wildmode=list:full
set list
set listchars=tab:◁∙▷,trail:∙,precedes:∙
set redrawtime=200
set grepprg=rg\ -i\ -n\ -w\ --vimgrep\ $*
set statusline=%<%f%h%m%r%=%b\ 0x%B\ %#warningmsg#\ %l,%c%V\ %P
set noswapfile

nmap + mz:m+<cr>`z
nmap - mz:m-2<cr>`z
vmap + :m'>+<cr>`<my`>mzgv`yo`z
vmap - :m'<-2<cr>`>my`<mzgv`yo`z

nnoremap <Esc><Esc> :w<cr>
nnoremap <leader>hl :nohlsearch<CR>
nnoremap <leader>x :!xdg-open %<cr><cr>

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
nnoremap <leader>/ :Rg<space>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent>gs :Git<cr>
nnoremap <silent>gb :Git blame<cr>
nnoremap <silent>gm :Git mergetool<cr>

let NERDTreeShowHidden = 0
let NERDTreeMinimalUI=1

let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '40%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'
