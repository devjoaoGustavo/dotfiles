filetype off
let skip_defaults_vim = 1

if filereadable(expand('~/.vim/conf/plugins.vim'))
  source ~/.vim/conf/plugins.vim
end

if filereadable(expand('~/.vim/conf/color_conf.vim'))
  source ~/.vim/conf/color_conf.vim
end

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

set shortmess+=cS

set shiftround
set softtabstop=2
set shiftwidth=2

set nobackup
set nowritebackup
set nrformats=
set path=,,
set number
set norelativenumber
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

set scrolloff=5

set title
set visualbell

" toggle list flag in order to display characters for space, tab eol, etc...
nnoremap <leader>m :set invlist<cr>

" set winwidth=84
" set winheight=5
" set winminheight=5
" set winheight=999

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
let $RUBYHOME=$HOME."/.asdf/installs/ruby/2.7.1"
set rubydll=$HOME/.asdf/installs/ruby/2.7.1/lib/libruby.2.7.dylib

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
