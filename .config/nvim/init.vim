filetype off
let skip_defaults_vim = 1

call plug#begin('~/.vim/plugged')

" Plug 'scrooloose/nerdtree'
" In order to replace nerdtree - begin
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-renderer-devicons.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/nerdfont.vim'
" In order to replace nerdtree - begin

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

Plug 'sainnhe/gruvbox-material'

Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'

Plug 'wakatime/vim-wakatime'

Plug 'jremmen/vim-ripgrep'

" LANGUAGES
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'fatih/vim-go'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'slashmili/alchemist.vim'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'rust-lang/rust.vim'
call plug#end()

lua require('mymodule')

let loaded_matchit = 1

let b:match_words = '\<if\>:\<end\>,\<do\>:\<end\>,\<def\>:\<end\>'
let g:terraform_fmt_on_save=1

let g:ale_enabled = 1
let g:ale_linters = {
      \ 'go': ['gopls'],
      \ }

let g:rustfmt_autosave = 1
let g:rust_clip_command = 'xclip -selection clipboard'

filetype plugin indent on

syntax enable
set termguicolors
set background=dark
colorscheme gruvbox-material

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

let mapleader = " "

autocmd TermOpen * startinsert
set inccommand=nosplit

set t_ZH=[3m
set t_ZR=[23m
set t_Co=256
set t_ut=

set encoding=UTF-8
set mouse=a

set autoindent
set copyindent
set smartindent

set expandtab
set fillchars=stlnc:\ ,vert:┃,fold:-,diff:-
set laststatus=2
set grepprg=rg\ -i\ -n\ -w\ --vimgrep\ $*
set hidden
set ignorecase
set smartcase
set modeline
set modelines=3
set nojoinspaces
set noswapfile

set shortmess+=cS

set shiftround
set softtabstop=2
set shiftwidth=2

set nobackup
set nowritebackup
set nrformats=
set path=.,,app/**
set number
set norelativenumber
set showmatch
set signcolumn=auto
set splitbelow
set splitright
set ttimeout timeoutlen=500
set nowrap

set autoread
set autowrite
set autowriteall

set noshowmode
set incsearch
set hlsearch
set showcmd
set listchars=tab:◁∙▷,trail:∙,precedes:∙,eol:⏎
set tags^=./.git/tags

set title
set novisualbell

" toggle list flag in order to display characters for space, tab eol, etc...
nnoremap <leader>m :set invlist<cr>

set wildmenu
set wildmode=list:longest,full

nnoremap <leader><leader> <c-^>
nnoremap <Esc><Esc> :w<cr>
tnoremap <Esc> <c-\><c-n>

nnoremap <leader>/ :Rg<space>

set showtabline=2
nnoremap <Tab> :tabn<cr>
nnoremap <S-Tab> :tabp<cr>

nnoremap gs :Git<cr>

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:fern#renderer = "devicons"

nnoremap <silent> <Leader>n :Fern . -drawer -toggle -keep -width=30<CR>
nnoremap <silent> <Leader>f :Fern . -reveal=% -drawer -toggle -keep -width=30<CR>

function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

" Remove all trailing space before save the buffer
autocmd BufWritePre * :%s/\s\+$//e

" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

let g:go_fmt_autosave = 1
let g:go_imports_autosave = 1
let g:go_mod_fmt_autosave = 1
let g:go_doc_popup_window = 1

" Edit this vimrc file
nnoremap <leader>fed :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>fer :so ~/.config/nvim/init.vim<cr>
nnoremap <leader>cf :let @+ = expand("%")<cr>
nnoremap <leader>hl :nohlsearch<CR>

nnoremap <Up> :echo "Do not use arrows 🤬"<cr>
nnoremap <Down> :echo "Do not use arrows 😤"<cr>
nnoremap <Left> :echo "Do not use arrows 🤬"<cr>
nnoremap <Right> :echo "Do not use arrows 😤"<cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'variable'

au! Filetype ruby setlocal textwidth=80

let g:ruby_host_prog = '/Users/joao.paula/.asdf/installs/ruby/3.0.1/bin/neovim-ruby-host'
let g:python3_host_prog = "/home/joao/.asdf/shims/python"
let g:python2_host_prog = "/usr/bin/python2"

" Golang
au! FileType go
      \ setlocal tabstop=8 |
      \ setlocal softtabstop=8 |
      \ setlocal shiftwidth=8 |
      \ setlocal textwidth=79 |
      \ setlocal noexpandtab |
      \ setlocal autoindent |
      \ setlocal fileformat=unix

" Python
au! FileType python
      \ setlocal tabstop=4 |
      \ setlocal softtabstop=4 |
      \ setlocal shiftwidth=4 |
      \ setlocal textwidth=79 |
      \ setlocal expandtab |
      \ setlocal autoindent |
      \ setlocal fileformat=unix

let NERDTreeIgnore=['\.pyc$', '\~$']
