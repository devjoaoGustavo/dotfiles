filetype off

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'wakatime/vim-wakatime'
Plug 'cormacrelf/vim-colors-github'
Plug 'morhetz/gruvbox'
Plug 'bagrat/vim-buffet'

Plug 'christoomey/vim-tmux-navigator'
Plug 'jremmen/vim-ripgrep'

" LANGUAGES
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'hashivim/vim-terraform'
Plug 'jparise/vim-graphql'
Plug 'pangloss/vim-javascript'
Plug 'slashmili/alchemist.vim'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

call plug#end()

packadd! matchit
let g:terraform_fmt_on_save=1

" vim-buffet configurations
let g:buffet_always_show_tabline = 0
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <C-t> :tabnew new<CR>

filetype plugin indent on

syntax on

set termguicolors
set background=dark

let g:gruvbox_termcolors=16

let g:lightline = { 'colorscheme': 'gruvbox' }

colorscheme gruvbox

let mapleader = " "

set t_ZH=[3m
set t_ZR=[23m
set t_Co=256
set t_ut=

set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

set autoindent
set copyindent
set expandtab
set fillchars=stlnc:\ ,vert:┃,fold:-,diff:-
set laststatus=2
set backspace=
set grepprg=rg\ --vimgrep\ $*
set nohidden
set ignorecase
set smartcase
set modeline
set modelines=3
set nojoinspaces
set noswapfile
set guicursor=

set shortmess+=cS

set shiftround
set softtabstop=2
set shiftwidth=2

set nobackup
set nowritebackup
set nrformats=
set path=.,,app/**
set number
set relativenumber
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

" set statusline=%<%f\ %h%m%r%=%y%=%B\ -\ %O%=%-14.(%l,%c%V%)\ %P

set title
set novisualbell

" toggle list flag in order to display characters for space, tab eol, etc...
nnoremap <leader>m :set invlist<cr>

set wildmenu
set wildmode=list:longest

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

let g:go_fmt_autosave = 1
let g:go_imports_autosave = 1
let g:go_mod_fmt_autosave = 1
let g:go_doc_popup_window = 1

" Edit this vimrc file
nnoremap <leader>fed :e ~/.vimrc<cr>
nnoremap <leader>fer :so ~/.vimrc<cr>
nnoremap <leader>cf :let @+ = expand("%")<cr>
nnoremap <leader>hl :nohlsearch<CR>

nnoremap <Up> :echo "Do not use arrows 🤬"<cr>
nnoremap <Down> :echo "Do not use arrows 😤"<cr>
nnoremap <Left> :echo "Do not use arrows 😡"<cr>
nnoremap <Right> :echo "Do not use arrows 😠"<cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" language specifics
" Ruby
if (! has('nvim'))
  let $RUBYHOME=$HOME."/.asdf/installs/ruby/2.7.1"
  set rubydll=$HOME/.asdf/installs/ruby/2.7.1/lib/libruby.2.7.dylib
endif

let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'variable'

au! Filetype ruby setlocal textwidth=80

" hi ColorColumn term=reverse ctermfg=grey ctermbg=darkblue guibg=gray guifg=white
" call matchadd('ColorColumn', '\%81v', 100)

let g:ruby_host_prog = '/Users/joao.paula/.asdf/installs/ruby/2.6.5/bin/neovim-ruby-host'

" PHP
au! FileType php setlocal shiftwidth=4 softtabstop=4

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

let g:python3_host_prog = "/Library/Frameworks/Python.framework/Versions/3.8/bin/python3.8"

let NERDTreeIgnore=['\.pyc$', '\~$']

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
