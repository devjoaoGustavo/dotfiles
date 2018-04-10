set encoding=utf-8
" To work cool, disable compatibility with Vi
set nocompatible

filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Keep plugin commands between vundle#begin/end.
call vundle#begin()
" Indispensable
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'colepeters/spacemacs-theme.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'mattn/emmet-vim'
Plugin 'alvan/vim-closetag'

" Choose languages
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'elixir-lang/vim-elixir'
Plugin 'guns/vim-clojure-static'
Plugin 'fatih/vim-go'
Plugin 'python-mode/python-mode'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'posva/vim-vue'
Plugin 'tpope/vim-commentary'
Plugin 'mileszs/ack.vim'
Bundle 'wakatime/vim-wakatime'
call vundle#end()

filetype plugin indent on
syntax enable

if (has("termguicolors"))
  set termguicolors
endif
set background=dark
colorscheme spacemacs-theme
" colorscheme hybrid

" https://github.com/powerline/fonts/tree/master/SourceCodePro
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

" Move the cursor to the matched string
set incsearch
" Search highlight
set hlsearch
" Search ignore case
set ignorecase
" Search do not wrap around
set nowrap

" Start scrolling 1 line before the horizontal window border
set scrolloff=1

" Avoid lags
set lazyredraw

" Display line numbers
set number
" Display relative numbers on the other lines
" set relativenumber
set numberwidth=4

" To display the status line always
set laststatus=2

" Dont unload buffers
set hidden

" New window is put below the current one
set splitbelow
" New window is put right of the current one
set splitright

" Show commands
set showcmd

" Hide mode status (INSERT, VISUAL)
set noshowmode

" Show the cursor position
set ruler

" Flash screen instead of sounding a beep
set visualbell

" Allow backspace in insert mode
set backspace=start,eol,indent

" Reduce the need for % in matching
set showmatch
set matchtime=2

" Tab characters entered will be changed to spaces
set expandtab
" Number of space characters inserted for indentation
set shiftwidth=2
set softtabstop=2

" Avoid creation of * .ext files
set nowritebackup
set nobackup
set noswapfile

" Automatically read changes
set autoread

" Hidden buffer instead of close
set hidden

" Increase history
set history=1000

" Space as leader
map <space> <leader>

let g:user_emmet_leader_key='<leader>'

" Window buffer navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Ctrl C + Ctrl V
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" closetag options
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'

" Multi cursors mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Airline
let g:airline_powerline_fonts = 1

" Remove Bars
set guioptions-=T
set guioptions-=t
set guioptions-=L
set guioptions-=l
set guioptions-=m
set guioptions-=r

" Save like spacemacs
nmap <leader>fs :w<cr>

" Quit like spacemacs
nmap <leader>qq :q<cr>

" Split window like spacemacs
nmap <leader>wv :vs<cr>
nmap <leader>ws :sp<cr>

" change for spec like spacemacs
nmap <leader>mrgp :A<cr>

" save and exit almost like spacemacs
nmap <leader>fsq :wq<cr>

" open the explorer almost like spacemacs
nmap <leader>fj :Ex<cr>

" Clean search
nmap \hl :nohlsearch<CR>

" Go to next tab
nmap <leader>x :tabn<cr>

" Go to previous tab
nmap <leader>z :tabp<cr>

" Open a new empty buffer
nmap <leader>N :enew<cr>

" Open a new tab
nmap <leader>tn :tabnew<cr>

" Move to the next buffer
nmap <leader>bn :bnext<CR>

" Move to the previous buffer
nmap <leader>bp :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Toggle NERDTree
nmap <silent> <Leader>n :NERDTreeToggle<CR>

" Toggle Tagbar
" nmap <silent> <Leader>tt :TagbarToggle<CR>

" Remove all trailing whitespaces at save
autocmd BufWritePre * :%s/\s\+$//e

autocmd FileType vue syntax sync fromstart

" Ignore some directories
set wildignore+=**/node_modules,**/bower_components,**/tmp,**/vendor,**/git

" Python mode disable some things
let g:pymode_options_colorcolumn = 0
let g:pymode_lint = 0
let g:pymode_run = 0
let g:pymode_virtualenv = 0
let g:pymode_doc = 0
let g:pymode_folding = 0
let g:pymode_rope = 0
