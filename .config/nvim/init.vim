" setting off filetype {{{
filetype off
let skip_defaults_vim = 1
" }}}

" PLUGINS{{{
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-rooter'
Plug 'jiangmiao/auto-pairs'
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'sainnhe/gruvbox-material'
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
"}}}

" setting filetype and syntax {{{
filetype plugin indent on
syntax enable
" }}}

" COLORSCHEME {{{
set termguicolors
set background=dark
colorscheme gruvbox
" }}}

" LEADER {{{
let g:mapleader = " "
let g:maplocalleader = ','
" }}}

" set settings{{{
set foldmethod=marker
set mouse=a
set inccommand=nosplit
set encoding=UTF-8
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
if !exists("neovide")
  set guicursor=n-v-c:block,i-ci-ve:ver35,r-cr:hor20,o:hor50
        \,a:blinkwait500-blinkoff300-blinkon200-Cursor/lCursor
        \,sm:block-blinkwait150-blinkoff100-blinkon150
endif
"}}}

" keymappings {{{
nnoremap gs :Git<cr>
nnoremap <Tab> :tabn<cr>
nnoremap <S-Tab> :tabp<cr>
nnoremap <Esc><Esc> :w<cr>
nnoremap <leader>/ :Rg<space>
nnoremap <leader><leader> <c-^>
nnoremap <leader>fed :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>fer :so ~/.config/nvim/init.vim<cr>
nnoremap <leader>ff :NERDTreeFind<CR>
nnoremap <leader>fs :w<cr>
nnoremap <leader>fy :let @+ = expand("%")<cr>
nnoremap <leader>hl :nohlsearch<CR>
nnoremap <leader>m :set invlist<cr>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>te :tabe %<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>hn :GitGutterNextHunk<cr>
nnoremap <leader>hh :GitGutterPrevHunk<cr>
nnoremap <leader>hq :GitGutterQuickFix<cr>
" Terminal
autocmd TermOpen * startinsert
nnoremap <leader>sh :sp term://bash<cr>
tnoremap <Esc> <c-\><c-n>
"}}}

" AUTO COMMANDS{{{
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
"}}}

" LET SETTINGS{{{{{{
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
let g:bufExplorerSplitBelow=1
let g:bufExplorerSplitRight=1
let g:bufExplorerSortBy='name'
let g:ale_enabled = 1
let g:ale_linters = { 'go': ['gopls'] }
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'xclip -selection clipboard'
"}}}

" nerdtree{{{
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = []
let NERDTreeStatusline = ''
let NERDTreeIgnore=['\.pyc$', '\~$']
let g:NERDTreeMapCustomOpen = 'l'
let g:NERDTreeMapCloseDir = 'h'
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
"}}}
