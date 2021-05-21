filetype off
let skip_defaults_vim = 1

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'airblade/vim-rooter'
Plug 'jiangmiao/auto-pairs'
Plug 'jlanzarotta/bufexplorer'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'sainnhe/gruvbox-material'
Plug 'rakr/vim-one'
Plug 'kien/ctrlp.vim'
Plug 'wakatime/vim-wakatime'
Plug 'jremmen/vim-ripgrep'
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
call plug#end()

let g:airline_powerline_fonts = 1
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

let mapleader = " "

autocmd TermOpen * startinsert

set t_ZH=[3m
set t_ZR=[23m
set t_Co=256
set t_ut=

set guicursor=n-v-c:block,i-ci-ve:ver35,r-cr:hor20,o:hor50
      \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175

set inccommand=nosplit
set encoding=UTF-8
set mouse=a
set autoindent
set copyindent
set smartindent
set clipboard+=unnamedplus
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
set cursorline
set nocursorcolumn
set shortmess+=cS
set shiftround
set softtabstop=2
set shiftwidth=2
set nobackup
set nowritebackup
set nrformats=
set path=.,,app/**,domains/**,plugins/**,deprecated_modules/**,modules/**,lib/**,vendor/**
set nonumber
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
set wildmenu
set wildmode=full
set showtabline=2
set noshowmode
set incsearch
set hlsearch
set showcmd
set listchars=tab:◁∙▷,trail:∙,precedes:∙,eol:⏎
set tags^=./.git/tags
set title
set novisualbell

" toggle list flag in order to display characters for space, tab eol, etc...
nnoremap gs :Git<cr>
nnoremap <Tab> :tabn<cr>
nnoremap <S-Tab> :tabp<cr>
nnoremap g<Tab> :bn<cr>
nnoremap g<S-Tab> :bp<cr>
tnoremap <Esc> <c-\><c-n>
nnoremap <Esc><Esc> :w<cr>
nnoremap <leader>m :set invlist<cr>
nnoremap <leader><leader> <c-^>
nnoremap <leader>fs :w<cr>
nnoremap <leader>/ :Rg<space>
nnoremap <leader>fed :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>fer :so ~/.config/nvim/init.vim<cr>
nnoremap <leader>cf :let @+ = expand("%")<cr>
nnoremap <leader>hl :nohlsearch<CR>
nnoremap <leader>0 :NERDTreeFocus<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>pt :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>te :tabe %<cr>

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
let g:ruby_host_prog = '/home/JOAO.GUSTAVO/.asdf/shims/neovim-ruby-host'
let g:python3_host_prog = "/usr/bin/python3"
let g:python2_host_prog = "/usr/bin/python2"
let NERDTreeIgnore=['\.pyc$', '\~$']
let g:NERDTreeMapCustomOpen = 'l'
let g:NERDTreeMapCloseDir = 'h'
let g:NERDTreeDirArrowExpandable = '→'
let g:NERDTreeDirArrowCollapsible = '↓'
let g:bufExplorerSplitBelow=1
let g:bufExplorerSplitRight=1
let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled = 1
