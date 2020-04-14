filetype off
let skip_defaults_vim = 1

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'

" PRODUCTIVITY
Plug 'wakatime/vim-wakatime'
Plug 'tricktux/vim-pomodoro'

" STYLES
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" FILES
" Plug 'christoomey/vim-tmux-navigator'
Plug 'jremmen/vim-ripgrep'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'git@github.com:PhilRunninger/bufselect.vim.git'

" GIT
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" LANGUAGES
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
" Plug 'Thinca/vim-quickrun'
Plug 'mattn/webapi-vim'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'mattn/emmet-vim', { 'for': ['html', 'eruby'] }
call plug#end()

packadd! matchit

let b:match_words = '\<if\>:\<end\>,\<do\>:\<end\>,\<def\>:\<end\>'
let g:ale_enabled = 0

filetype plugin indent on
syntax on

set termguicolors
colorscheme onehalfdark

" hi Comment    cterm=italic guifg=#5C6370 ctermfg=59
" hi Normal     ctermbg=NONE guibg=NONE
" hi LineNr     ctermbg=NONE guibg=NONE
" hi SignColumn ctermbg=NONE guibg=NONE

let mapleader = " "

if has('nvim')
  autocmd TermOpen * startinsert
  set inccommand=nosplit
endif

set t_ZH=[3m
set t_ZR=[23m
set t_Co=256
set t_ut=

set autoindent
set copyindent
set expandtab
set fillchars=stlnc:=,vert:\|,fold:-,diff:-
set laststatus=1
set backspace=   " set backspace=indent,eol,start
" set guicursor=
" set clipboard=
set grepprg=rg\ --vimgrep\ $*
set nohidden
set ignorecase
set smartcase
set modeline
set modelines=3
set nojoinspaces
" Settings in order to use swap files
" set dir=/var/tmp
set noswapfile
" set updatecount=200
" set updatetime=300

set shortmess+=cS

set shiftround
set softtabstop=2
set shiftwidth=2

set nowritebackup
set nrformats=
set path=,,
set number
set relativenumber
set numberwidth=1
set showmatch
set signcolumn=auto
set splitbelow
set splitright
set ttimeout timeoutlen=500
set nowrap
set autoread
set autowriteall
set showmode
set incsearch
set hlsearch
set showcmd
set listchars=tab:◁∙▷,trail:∙,precedes:∙,eol:⏎
set tags^=./.git/tags
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" toggle list flag in order to display characters for space, tab eol, etc...
nnoremap <leader>m :set invlist<cr>

set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

nnoremap <leader><leader> <c-^>
tnoremap <Esc> <c-\><c-n>

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Toggle NERDTree
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>f :NERDTreeFind<CR>

" Remove all trailing space before save the buffer
autocmd BufWritePre * :%s/\s\+$//e

" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" Edit this vimrc file
nnoremap <leader>fed :e ~/.vimrc<cr>
nnoremap <leader>fer :so ~/.vimrc<cr>

nnoremap <Up> :echo "Do not use arrows 🤬"<cr>
nnoremap <Down> :echo "Do not use arrows 😤"<cr>
nnoremap <Left> :echo "Do not use arrows 😡"<cr>
nnoremap <Right> :echo "Do not use arrows 😠"<cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap gs :Rg<space>
nnoremap gy :w<cr>
nnoremap <c-q> :q<cr>
nnoremap <leader>o :only<cr>
nnoremap <leader>cf :let @+ = expand("%")<cr>

nnoremap <leader>l :ShowBufferList<cr>
nnoremap <leader>bq :bp <BAR> bd #<CR>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>hl :nohlsearch<CR>
nnoremap <leader>sn :new<cr>
nnoremap <leader>ss :sp<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>te :tabedit %<cr>
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>vn :vnew<cr>
nnoremap <leader>vv :vs<cr>

" language specifics
" Ruby
let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'variable'

au! Filetype ruby setlocal textwidth=80

hi ColorColumn term=reverse ctermfg=grey ctermbg=darkblue guibg=gray guifg=white
call matchadd('ColorColumn', '\%81v', 100)

let g:ruby_host_prog = '/Users/joao.paula/.rvm/gems/ruby-2.7.0/bin/neovim-ruby-host'

" PHP
au! FileType php setlocal shiftwidth=4 softtabstop=4

" Python
au! FileType python
      \ setlocal tabstop=4 |
      \ setlocal softtabstop=4 |
      \ setlocal shiftwidth=4 |
      \ setlocal textwidth=79 |
      \ setlocal expandtab |
      \ setlocal autoindent |
      \ setlocal fileformat=unix

let g:python3_host_prog = "/Library/Frameworks/Python.framework/Versions/3.8/bin/python3.8"

"Rust
let g:rustc_path = $HOME."/.asdf/shims/rustc"
let g:rust_recommended_style = 1
nnoremap <leader>rr :RustRun<cr>
nnoremap <leader>rf :RustFmt<cr>
nnoremap <leader>cr :Crun<cr>
nnoremap <leader>cc :Ccheck<cr>
nnoremap <leader>cb :Cbuild<cr>

" Elixir
nnoremap <leader>gf :Mix format %<cr>
" end of language customs

let NERDTreeIgnore=['\.pyc$', '\~$']

" gitgutter customs
let g:gitgutter_preview_win_floating = 1
nnoremap <leader>hn :GitGutterNextHunk<cr>
nnoremap <leader>hb :GitGutterPrevHunk<cr>
" end of gitgutter customs

" Pomodoro customs
let g:pomodoro_time_work = 30
let g:pomodoro_time_slack = 5
nnoremap gpm :PomodoroStart<cr>
nnoremap gm :PomodoroStatus<cr>
nnoremap gps :PomodoroStop<cr>
" end of Pomodoro customs

" Expand region customs
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :0,
      \ 'ip'  :0,
      \ 'ie'  :1,
      \ }
