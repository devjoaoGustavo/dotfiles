set termguicolors
let mapleader = " "

packadd minpac
call minpac#init()

call minpac#add('2072/PHP-Indenting-for-VIm', { 'type': 'opt' })
call minpac#add('cakebaker/scss-syntax.vim', { 'type': 'opt' })
call minpac#add('elixir-editors/vim-elixir')
call minpac#add('jremmen/vim-ripgrep')
call minpac#add('kien/ctrlp.vim')
call minpac#add('machakann/vim-highlightedyank')
call minpac#add('mattn/emmet-vim', { 'type': 'opt' })
call minpac#add('mhinz/vim-mix-format')
call minpac#add('ngmy/vim-rubocop')
call minpac#add('ntpeters/vim-better-whitespace')
call minpac#add('pangloss/vim-javascript', { 'type': 'opt' })
call minpac#add('scrooloose/nerdtree')
call minpac#add('terryma/vim-multiple-cursors')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-surround')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('w0rp/ale')
call minpac#add('wakatime/vim-wakatime')

let g:user_emmet_leader_key=','

set autoindent
set backspace=
set clipboard=unnamedplus
set copyindent
set expandtab
set fillchars=
set grepprg=rg\ --vimgrep\ $*
set guicursor=
set hidden
set history=100
set ignorecase
set inccommand=nosplit
set modeline
set modelines=3
set nobackup
set nocursorline
set nojoinspaces
set noswapfile
set nowritebackup
set nrformats=
set path+=**
set relativenumber
set shiftround
set shiftwidth=2
set showmatch
set showmode
set signcolumn=no
set smartcase
set softtabstop=2
set splitbelow
set splitright
set ttimeout timeoutlen=500
set viminfo=""
set winheight=5
set winheight=999
set winminheight=5
set winminwidth=5
set winwidth=84

nnoremap <leader><leader> <c-^>
noremap <Esc><Esc> :w<cr>
tnoremap <Esc> <c-\><c-n>

" start terminal buffer in the insert mode
autocmd TermOpen * startinsert

" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

nmap <Up> :echo "Use k"<cr>
nmap <Down> :echo "Use j"<cr>
nmap <Left> :echo "Use h"<cr>
nmap <Right> :echo "Use l"<cr>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap <leader>o :only<cr>

" let g:ctrlp_user_command = 'rg --files %s'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_mruf_max = 2

nmap <leader>cf :let @+ = expand("%")<cr>
nmap <leader>vv :vs<cr>
nmap <leader>ss :sp<cr>
nmap <leader>vn :vnew<cr>
nmap <leader>sn :new<cr>
nmap <leader>hl :nohlsearch<CR>
nmap <leader>te :tabedit %<cr>
nmap <leader>tc :tabclose<cr>
nmap <leader>tn :tabnew<cr>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bb :ls<cr>

" Remove all trailing whitespaces at save
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" Rubocop config
nmap <Leader>rr :RuboCop %<CR>
let g:vimrubocop_keymap = 0
let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'variable'

" Edit this vimrc file
nmap <leader>fed :e ~/.config/nvim/init.vim<cr>
nmap <leader>fer :so ~/.config/nvim/init.vim<cr>

let g:PHP_noArrowMatching = 1
autocmd FileType php setlocal shiftwidth=4 softtabstop=4
autocmd FileType json setlocal shiftwidth=4 softtabstop=4

map <leader>n :NERDTreeToggle<CR>

" insert magic commentary for ruby files
nnoremap <leader>fr gg:-1read ~/.vim/snippets/magic-comment-ruby<CR>:w<CR><c-o>

autocmd FileType ruby setlocal textwidth=80
autocmd FileType ruby setlocal colorcolumn=+1

" Don't syntax highlight markdown because it's often wrong
autocmd! FileType markdown setlocal syn=off

" format json
" python -mjson.tool
