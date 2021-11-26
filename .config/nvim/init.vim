filetype off

lua <<PLUGINS
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- use 'tpope/vim-rails'
  use { 'vim-ruby/vim-ruby', ft = { 'ruby' } }
  use 'tpope/vim-rails'
  use 'christoomey/vim-tmux-navigator'
  use {'andymass/vim-matchup', event = 'VimEnter'}
  use 'preservim/nerdtree'
  use 'airblade/vim-rooter'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-commentary'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'sainnhe/gruvbox-material'
  use 'pbrisbin/vim-colors-off'
  use 'wakatime/vim-wakatime'
  use {'ojroques/nvim-hardline'}
  use 'jremmen/vim-ripgrep'
  use { 'neoclide/coc.nvim', branch = 'release' }
  use { 'pangloss/vim-javascript', ft = { 'javascript' } }
  use 'hashivim/vim-terraform'
  use { 'junegunn/fzf', run = function() vim.fn['fzf#install()'](0) end }
  use 'junegunn/fzf.vim'
  use 'elixir-editors/vim-elixir'
  use 'APZelos/blamer.nvim'
  use 'dense-analysis/ale'
end)
PLUGINS

lua <<CONFIG
require('hardline').setup {
  theme = 'gruvbox',
}
CONFIG

filetype plugin on
filetype indent on

syntax enable

let g:coc_global_extensions = ['coc-html-css-support',
                        \ 'coc-tsserver', 'coc-vimlsp',
                        \ 'coc-json', 'coc-git', 'coc-solargraph',
                        \ 'coc-html-css-support']

set termguicolors
nnoremap <leader>l :set background=light<cr><leader>gZ
nnoremap <leader>d :set background=dark<cr><leader>gZ
colorscheme off

let g:colors_off_a_little = 1
let g:mapleader = " "
let g:maplocalleader = ','

set magic
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set cmdheight=1
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
set nocursorline
set nocursorcolumn
set shortmess+=cS
set shiftround
set softtabstop=2
set shiftwidth=2
set nobackup
set path=.,,components/**,apps/**,lib/**,app/**,domains/**,plugins/**,deprecated_modules/**,modules/**,lib/**,vendor/**
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
set showtabline=1
set noshowmode
set incsearch
set hlsearch
set showcmd
set listchars=tab:◁∙▷,trail:∙,precedes:∙,eol:⏎
set tags^=./.git/tags
set title
set novisualbell
set history=500
set sidescroll=5
set listchars+=precedes:<,extends:>

nnoremap <silent> <leader>bd :bd<cr>
nnoremap <silent> <Esc><Esc> :w<cr>
nnoremap <leader>/ :Rg<space>
nnoremap <silent> <leader><leader> <c-^>
nnoremap <silent> gz :e ~/.config/nvim/init.vim<cr>
nnoremap <silent> gZ :so ~/.config/nvim/init.vim<cr>
nnoremap <silent> gy :let @+ = expand("%")<cr>
nnoremap <silent><leader>hl :nohlsearch<CR>
nnoremap <silent> \q :nohlsearch<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>te :tabe %<cr>
nnoremap <c-p> :Files .<cr>
nnoremap <c-s> :Buffers<cr>
nnoremap <silent><leader>bl :BLines<cr>
nnoremap <silent><leader>. :Lines<cr>

nmap + mz:m+<cr>`z
nmap - mz:m-2<cr>`z
vmap + :m'>+<cr>`<my`>mzgv`yo`z
vmap - :m'<-2<cr>`>my`<mzgv`yo`z

fun! CleanTrailingSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun
autocmd BufWritePre * :call CleanTrailingSpaces()

autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

let g:go_fmt_autosave = 1
let g:go_imports_autosave = 1
let g:go_mod_fmt_autosave = 1
let g:go_doc_popup_window = 1

let g:ruby_host_prog = '/home/JOAO.GUSTAVO/.asdf/shims/neovim-ruby-host'

let g:python3_host_prog = "/usr/bin/python3"
let g:python2_host_prog = "/usr/bin/python2"

let g:terraform_fmt_on_save=1
let g:terraform_binary_path="/home/JOAO.GUSTAVO/.asdf/shims/terraform"

let NERDTreeShowHidden = 0
let NERDTreeMinimalUI=1

let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '40%' }

let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = ' > '
let g:blamer_date_format = '%d/%m/%Y'
let g:blamer_template = '<committer>, <committer-time> • <commit-short> • <summary>'
