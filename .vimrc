vim9script
g:skip_defaults_vim = 1
filetype off
set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'fladson/vim-kitty'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/nerdtree'
Plug 'wakatime/vim-wakatime'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elixir-editors/vim-elixir'
Plug 'sainnhe/gruvbox-material'
call plug#end()

filetype plugin on
filetype indent on
syntax enable

&term = "xterm-256color"
if has("terminfo")
  set t_Co=8
  set t_Sf=<Esc>[&v%p1%dS
  set t_Sb=<Esc>[&v7S
else
  set t_Co=8
  set t_Sf=<Esc>[&v%dS
  set t_Sb=<Esc>[&v7S
endif


g:mapleader = " "

&t_ut = ''
set termguicolors
set background=dark
colorscheme gruvbox-material

command Branch GitBranch()
def GitBranch(): string
  var branch_name = trim(system('git rev-parse --abbrev-ref HEAD 2&> /dev/null'))
  if branch_name != ''
    return '[' .. branch_name .. ']'
  else
    return ""
  endif
enddef
set statusline=%<%f\ %h%m%r\ %{GitBranch()}\ %=%-14.(%l,%c%V%)\ %P

g:coc_global_extensions = ['coc-html-css-support',
      \ 'coc-tsserver', 'coc-vimlsp',
      \ 'coc-json', 'coc-git', 'coc-solargraph',
      \ 'coc-html-css-support', 'coc-fzf-preview', 'coc-elixir']

set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon100
set guicursor+=i:blinkwait10
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
# set statusline=%<%f%h%m%r%=\ col:\ %c%V\ %P
set noswapfile
set history=500
set ruler
set cmdheight=1
set hid
set showmatch
set nowrap
set shiftwidth=2
set tabstop=2
set smarttab
set noerrorbells
set novisualbell
set t_vb=
set tm=500

try
  set switchbuf=useopen,usetab,vsplit
  set stal=1
catch
endtry

nmap + mz:m+<cr>`z
nmap - mz:m-2<cr>`z
vmap + :m'>+<cr>`<my`>mzgv`yo`z
vmap - :m'<-2<cr>`>my`<mzgv`yo`z

nnoremap <Esc><Esc> :w<cr>
nnoremap <silent> gy :let @+ = expand("%")<cr>
nnoremap <leader>hl :nohlsearch<CR>
nnoremap <leader>x :!xdg-open %<cr><cr>

def CleanTrailingSpaces()
  var save_cursor = getpos(".")
  var old_query = getreg('/')
  silent! :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
enddef

legacy autocmd BufWritePre * CleanTrailingSpaces()
legacy autocmd BufReadPost *
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

var NERDTreeShowHidden = 0
var NERDTreeMinimalUI = 1

g:fzf_buffers_jump = 1
g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
g:fzf_layout = { 'down': '40%' }
g:fzf_history_dir = '~/.local/share/fzf-history'

# This triggers the compilation of the script functions
defcompile
