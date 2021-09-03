filetype off

lua <<PLUGINS
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'andymass/vim-matchup', event = 'VimEnter'}
  use 'preservim/nerdtree'
  use 'christoomey/vim-tmux-navigator'
  use 'airblade/vim-rooter'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-commentary'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-rails'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'sainnhe/gruvbox-material'
  use 'wakatime/vim-wakatime'
  use 'jremmen/vim-ripgrep'
  use { 'vim-ruby/vim-ruby', ft = { 'ruby' } }
  use { 'neoclide/coc.nvim', branch = 'release' }
  use { 'pangloss/vim-javascript', ft = { 'javascript' } }
  use 'hashivim/vim-terraform'
  use { 'junegunn/fzf', run = function() vim.fn['fzf#install()'](0) end }
  use 'junegunn/fzf.vim'
end)
PLUGINS

filetype plugin on
filetype indent on

syntax enable

let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_palette = 'material'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_show_eob = 0
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_diagnostic_line_highlight = 0
let g:gruvbox_material_diagnostic_text_highlight = 0
let g:gruvbox_material_sign_column_background = 'none'
let g:gruvbox_material_menu_selection_background = 'yellow'
let g:coc_global_extensions = ['coc-html-css-support',
                        \ 'coc-tsserver', 'coc-vimlsp',
                        \ 'coc-json', 'coc-git', 'coc-solargraph',
                        \ 'coc-html-css-support']

set termguicolors
set background=dark
colorscheme gruvbox-material

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
set showmode
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

nnoremap <silent> gs :Git<cr>
nnoremap <silent> gb :G blame<cr>
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
nnoremap <silent><leader>bl :BLines
nnoremap <silent><leader>. :Lines<cr>

" Terminal
autocmd TermOpen * startinsert
nnoremap <leader>sh :sp term://bash<cr>
tnoremap <Esc> <c-\><c-n>

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

" let g:go_fmt_autosave = 1
" let g:go_imports_autosave = 1
" let g:go_mod_fmt_autosave = 1
" let g:go_doc_popup_window = 1
let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_host_prog = '/home/JOAO.GUSTAVO/.asdf/shims/neovim-ruby-host'
let g:python3_host_prog = "/usr/bin/python3"
let g:python2_host_prog = "/usr/bin/python2"
let g:terraform_fmt_on_save=1
let g:terraform_binary_path="/home/JOAO.GUSTAVO/.asdf/shims/terraform"
let NERDTreeShowHidden = 0
let NERDTreeMinimalUI=1
let g:tmux_navigator_save_on_switch = 2
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '40%' }
