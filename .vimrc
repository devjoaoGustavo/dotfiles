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
Plugin 'tpope/vim-surround'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'godlygeek/tabular'
Plugin 'dracula/vim'
Plugin 'powerline/powerline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Yggdroot/indentLine'
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/HTML-AutoCloseTag'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'
Plugin 'KKPMW/oldbook-vim'
Plugin 'NLKNguyen/papercolor-theme'

" Choose languages
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
" elixir
" Plugin 'elixir-lang/vim-elixir'
Plugin 'elixir-editors/vim-elixir'
Plugin 'slashmili/alchemist.vim'

Plugin 'guns/vim-clojure-static'
Plugin 'fatih/vim-go'
Plugin 'python-mode/python-mode'
Plugin 'pangloss/vim-javascript'
Plugin 'posva/vim-vue'
Plugin 'tpope/vim-commentary'
Plugin 'mileszs/ack.vim'
Bundle 'wakatime/vim-wakatime'
call vundle#end()

filetype plugin indent on
syntax on

set background=dark
set termguicolors

colorscheme paperColor
" colorscheme oldbook
" colorscheme spacemacs-theme

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
set relativenumber
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

" Allow bacskspace in insert mode
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
set history=5

" Space as leader
map <space> <leader>

let g:user_emmet_leader_key='<leader>'

" Window buffer navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" RSpec.vim mappings
map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'

let g:tslime_always_current_session = 1
let g:tslime_always_current_window  = 1

" relative path
nnoremap <leader>cf :let @+ = expand("%")<cr>
" full path
nnoremap <leader>cF :let @+ = expand("%:p")<cr>
" just filename
nnoremap <leader>ct :let @+ = expand("%:t")<cr>

" Ctrl C + Ctrl V
map <C-c> "+y
map <leader>y "+y
map <C-x> "+c
" Avoid control C to overwrite v-block feature
" map <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Git
map <leader>gb :Gblame<CR>
map <leader>gs :Gstatus<CR>
map <leader>gd :Gvdiff<CR>

" resize windows
map <leader>, <C-w><
map <leader>. <C-w>>
map <leader>- <C-w>-
map <leader>= <C-w>+

" closetag options
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'

" Multi cursors mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep        = ''
let g:airline_right_sep       = ''

" Remove Bars
set guioptions-=T
set guioptions-=t
set guioptions-=L
set guioptions-=l
set guioptions-=m
set guioptions-=r

" Thing for tabular
if exists(":Tabularize")
  nmap <Leader>a= :'<,'>Tabularize /=<CR>
  vmap <Leader>a= :'<,'>Tabularize /=<CR>
  nmap <Leader>a: :'<,'>Tabularize /:\zs<CR>
  vmap <Leader>a: :'<,'>Tabularize /:\zs<CR>
  nmap <Leader>a, :'<,'>Tabularize /,\zs<CR>
  vmap <Leader>a, :'<,'>Tabularize /,\zs<CR>
endif

" Fast saving
nmap <leader>w :w!<cr>
nmap <Esc><Esc> :w<cr>

" Quit like spacemacs
nmap <leader>qq :q<cr>

nmap <leader>vv :vs<cr>
nmap <leader>ss :sp<cr>

" new buffers
nmap <leader>vn :vnew<cr>
nmap <leader>sn :new<cr>

" Clean search
nmap <leader>hl :nohlsearch<CR>

" Go to next tab
nmap <leader>x :tabn<cr>

" Go to previous tab
nmap <leader>z :tabp<cr>

" Edit the current window in a new tab
nmap <leader>te :tabedit %<cr>

" Close the current tab
nmap <leader>tc :tabclose<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

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

" Open the Explore in the current buffer
nmap <leader>we :Explore<cr>

" Toggle Tagbar
" nmap <silent> <Leader>tt :TagbarToggle<CR>

" ack
cnoreabbrev Ack Ack!
nnoremap <Leader>skp :Ack!<Space>

" Remove all trailing whitespaces at save
autocmd BufWritePre * :%s/\s\+$//e

autocmd FileType vue syntax sync fromstart

" Ignore some directories
set wildignore+=**/node_modules,**/bower_components,**/tmp,**/vendor,**/git

" Python mode disable some things
let g:pymode_options_colorcolumn = 0
let g:pymode_lint                = 0
let g:pymode_run                 = 0
let g:pymode_virtualenv          = 0
let g:pymode_doc                 = 0
let g:pymode_folding             = 0
let g:pymode_rope                = 0

