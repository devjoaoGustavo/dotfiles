" To work cool, disable compatibility with Vi
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
" Keep Plug commands between vundle#begin/end.
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-vinegar'
Plugin 'wakatime/vim-wakatime'
Plugin 'jremmen/vim-ripgrep'
Plugin 'tpope/vim-commentary'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'ngmy/vim-rubocop'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'elixir-editors/vim-elixir', { 'for': ['elixir', 'eelixir'] }
Plugin 'mhinz/vim-mix-format'
Plugin 'pangloss/vim-javascript'
Plugin 'tmhedberg/matchit'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'tomasr/molokai'
Plugin 'sonph/onehalf'
call vundle#end()

filetype plugin indent on
syntax on

set termguicolors

set background=dark " Set to dark for a dark variant
colorscheme onehalfdark

" Space as leader
let mapleader = " "

" Move the cursor to the matched string
set incsearch
set hlsearch
" Search ignore case

set ignorecase
set smartcase

set viminfo=""

nnoremap <leader><leader> <c-^>

function! GitBranch()
  return system("echo \"($(git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'))\" | tr -d '\n'")
endfunction\

set statusline=%<%f\ (%{&ft})\ %{GitBranch()}\ %-4(%m%)%=%-19(%l,%c%V%)\ %P

" Don't syntax highlight markdown because it's often wrong
autocmd! FileType mkd setlocal syn=off
" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

set showcmd
set ruler

if has('nvim')
  set clipboard=unnamedplus
endif

" set guicursor=
set nocursorline

set laststatus=2

" Display relative numbers on the other lines
set relativenumber

set path+=**
set wildmenu

" Preserve buffer unwritten when editing other ones. Warning is thrown when
" try to exit
set hidden
set splitbelow
set splitright
set showmode

set belloff=all

set textwidth=80
set colorcolumn=+1
" hi ColorColumn guibg=#073642

set shell=bash

set backspace=indent,eol,start

" Fix slow O inserts
set ttimeout timeoutlen=500 ttimeoutlen=100

set modeline
set modelines=3

set nofoldenable

set autoindent
set copyindent

" Tab characters entered will be changed to spaces
set expandtab

" Number of space characters inserted for indentation
set shiftwidth=2
set softtabstop=2
set shiftround

set matchtime=2

if !has('nvim')
  set ttyfast
endif

" Avoid creation of * .ext files
set nowritebackup
set nobackup
set autoread
set noswapfile

set nojoinspaces
" Automatically read changes

set signcolumn=no

" Increase history
set history=100

" Hitting K in a Ruby file opens rdoc, which completely breaks the terminal
" to the point of having to kill vim and do `reset`. Unmap it entirely.
nnoremap K <Nop>

nmap <Up> :echo "Use k"<cr>
nmap <Down> :echo "Use j"<cr>
nmap <Left> :echo "Use h"<cr>
nmap <Right> :echo "Use l"<cr>

nnoremap <leader>o :only<cr>

" let g:ctrlp_user_command = 'rg --files %s'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_mruf_max = 2

set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

" Window buffer navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" relative path
nnoremap <leader>cf :let @+ = expand("%")<cr>
" full path
nnoremap <leader>cF :let @+ = expand("%:p")<cr>
" just filename
nnoremap <leader>ct :let @+ = expand("%:t")<cr>

" resize windows
map <leader>, <C-w><
map <leader>. <C-w>>
map <leader>- <C-w>-
map <leader>= <C-w>+

" Multi cursors mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Thing for tabular
if exists(":Tabularize")
  nmap <Leader>a= :'<,'>Tabularize /=<CR>
  vmap <Leader>a= :'<,'>Tabularize /=<CR>
  nmap <Leader>a: :'<,'>Tabularize /:\zs<CR>
  vmap <Leader>a: :'<,'>Tabularize /:\zs<CR>
  nmap <Leader>a, :'<,'>Tabularize /,\zs<CR>
  vmap <Leader>a, :'<,'>Tabularize /,\zs<CR>
endif

nmap <leader>vv :vs<cr>
nmap <leader>ss :sp<cr>

" new buffers
nmap <leader>vn :vnew<cr>
nmap <leader>sn :new<cr>

" Clean search
nmap <leader>hl :nohlsearch<CR>

" Edit the current window in a new tab
nmap <leader>te :tabedit %<cr>

" Close the current tab
nmap <leader>tc :tabclose<cr>

" Open a new tab
nmap <leader>tn :tabnew<cr>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" list buffers
nmap <leader>bb :ls<cr>

" Rgrep
set grepprg=rg\ --vimgrep\ $*
nnoremap <c-a> :Rg<Space>

" Remove all trailing whitespaces at save
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" Ignore some files and directories
set wildignore=
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/deps/*,*/cover/*
set wildignore+=**/*.jpg,*.jpeg,*.gif,**/*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=**/node_modules,**/bower_components,**/tmp,**/vendor,**/git

" Rubocop config
nmap <Leader>rr :RuboCop %<CR>
let g:vimrubocop_keymap = 0
let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'variable'

" run credo in the current buffer
nmap <leader>cc :Mix credo %<cr>
nmap <leader>mf :Mix format %<cr>
nmap <leader>ed :ExDoc<cr>

" Edit this vimrc file
nmap <leader>fed :e ~/.vimrc<cr>
nmap <leader>fer :so ~/.vimrc<cr>

let g:PHP_noArrowMatching = 1
autocmd FileType php setlocal shiftwidth=4 softtabstop=4
autocmd FileType json setlocal shiftwidth=4 softtabstop=4

map <leader>n :NERDTreeToggle<CR>

" prevent auto-pairs from map <M-p> as toggle
if has('nvim')
  let g:AutoPairsShortcutToggle = ''
endif

" start terminal buffer in the insert mode
if has('nvim')
  autocmd TermOpen * startinsert
endif

" insert magic commentary for ruby files
nnoremap <leader>fr gg:-1read ~/.vim/snippets/magic-comment-ruby<CR>:w<CR><c-o>

" create a new function in elixir mode
nnoremap <leader>fun odef<space>public_function<space>do<cr>end<Esc>kwciw
nnoremap <leader>fup odefp<space>private_function<space>do<cr>end<Esc>kwviwc
nnoremap <leader>mod idefmodule<space>MyModule<space>do<cr>end<Esc>kwviwc

" create a new method in ruby mode
autocmd FileType ruby nnoremap met odef<space>method_name<cr>end<Esc>kwviwc
autocmd FileType ruby nnoremap mcl iclass<space>MyClass<cr>end<Esc>kwviwc


" format json
" python -mjson.tool
