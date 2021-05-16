filetype off
let skip_defaults_vim = 1

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neomru.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'sainnhe/gruvbox-material'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'wakatime/vim-wakatime'
Plug 'jremmen/vim-ripgrep'
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'fatih/vim-go'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'maralla/completor.vim'

Plug 'pangloss/vim-javascript'
Plug 'slashmili/alchemist.vim'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'rust-lang/rust.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

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

set clipboard+=unnamedplus
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
" set tags^=./.git/tags

set title
set novisualbell
set wildmenu
set wildmode=full
set wildchar=<Tab>
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

nnoremap <S-Tab> :tabp<cr>
nnoremap <Tab> :tabn<cr>
nnoremap <esc><esc> :w<cr>
nnoremap <leader>/ :Rg<space>
nnoremap <leader><leader> <c-^>

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap gs :Git<cr>
tnoremap <esc> <c-\><c-n>

let g:NERDTreeDirArrowExpandable = '→'
let g:NERDTreeDirArrowCollapsible = '↓'

" Remove all trailing space before save the buffer
autocmd BufWritePre * :%s/\s\+$//e

" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:go_fmt_autosave = 1
let g:go_imports_autosave = 1
let g:go_mod_fmt_autosave = 1
let g:go_doc_popup_window = 1
let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_host_prog = '/home/joao/.asdf/installs/ruby/3.0.1/bin/neovim-ruby-host'
let g:python3_host_prog = "/usr/bin/python3"
let g:python2_host_prog = "/usr/bin/python2"

nnoremap <leader>fed :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>fer :so ~/.config/nvim/init.vim<cr>
nnoremap <leader>cf :let @+ = expand("%")<cr>
nnoremap <leader>hl :nohlsearch<CR>

call denite#custom#var('file/rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '--ignore=*.pyc', '-g', ''])

" Change sorters.
call denite#custom#source(
      \ 'file/rec', 'sorters', ['sorter_sublime'])

" Change default prompt
call denite#custom#option('default', 'prompt', '➤ ')

" Change ignore_globs
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/*', '*.pyc',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '*.png'])

nnoremap <space>v :Denite file/rec -default-action=vsplit<cr>
nnoremap <space>s :Denite file/rec -default-action=split<cr>
nnoremap <space>e :Denite file/rec -winheight=10 <cr>
nnoremap <space>m :Denite file_mru -winheight=10 -vertical-preview -auto-action=preview -preview-width=40 <cr>
nnoremap <space>b :Denite buffer -winheight=20 -winwidth=60 -vertical-preview -auto-action=preview -preview-width=40 <cr>

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')

  nnoremap <silent><buffer><expr> s denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> v denite#do_map('do_action', 'vsplit')

  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction


let g:LanguageClient_serverCommands = {
    \ 'rust': ['/home/joao/.asdf/shims/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/home/joao/.local/bin/pyls'],
    \ 'ruby': ['/home/joao/.asdf/shims/solargraph', 'stdio'],
    \ }
