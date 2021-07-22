filetype off
let skip_defaults_vim = 1

lua << EOF
-- load /home/joao/.config/nvim/lua/plugins.lua
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'andymass/vim-matchup', event = 'VimEnter'}
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }
  use 'kyazdani42/nvim-web-devicons'
  use 'preservim/nerdtree'
  use 'ryanoasis/vim-devicons'
  use 'airblade/vim-rooter'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-commentary'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-rails'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'dense-analysis/ale'
  use 'sainnhe/gruvbox-material'
  use 'wakatime/vim-wakatime'
  use 'jremmen/vim-ripgrep'
  use 'mxw/vim-jsx'
  use 'mattn/emmet-vim'
  use { 'elixir-editors/vim-elixir',  ft = 'elixir' }
  use { 'vim-ruby/vim-ruby', ft = 'ruby' }
  use { 'fatih/vim-go', ft = 'go' }
  use { 'pangloss/vim-javascript', ft = 'javascript' }
  use { 'slashmili/alchemist.vim', ft = 'elixir' }
  use { 'rust-lang/rust.vim', ft = 'rust' }
  use { 'christoomey/vim-tmux-navigator' }
  use { 'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension' }
  use {
    "vhyrro/neorg", config = function()
      require('neorg').setup {
        -- Tell Neorg what modules to load
        load = {
          ["core.defaults"] = {}, -- Load all the default modules
          ["core.norg.concealer"] = {}, -- Allows for use of icons
          ["core.norg.dirman"] = {
            config = {
              workspaces = {
                my_workspace = '~/neorg'
              }
            }
          }
        },
      }
    end
  }

end)



EOF

filetype plugin indent on
syntax enable

let g:gruvbox_material_sign_column_background = 'none'

set termguicolors
set background=dark
colorscheme gruvbox-material

let g:mapleader = " "
let g:maplocalleader = ','

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
set noshowmode
set incsearch
set hlsearch
set showcmd
set listchars=tab:◁∙▷,trail:∙,precedes:∙,eol:⏎
set tags^=./.git/tags
set title
set novisualbell

nnoremap gs :Git<cr>
nnoremap <Tab> :tabn<cr>
nnoremap <S-Tab> :tabp<cr>
nnoremap <Esc><Esc> :w<cr>
nnoremap <leader>/ :Rg<space>
nnoremap <leader><leader> <c-^>
nnoremap <silent>gz :e ~/.config/nvim/init.vim<cr>
nnoremap <silent>gZ :so ~/.config/nvim/init.vim<cr>
nnoremap <silent>gy :let @+ = expand("%")<cr>
nnoremap <leader>hl :nohlsearch<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
" Terminal
autocmd TermOpen * startinsert
nnoremap <leader>sh :sp term://bash<cr>
tnoremap <Esc> <c-\><c-n>

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

let g:go_fmt_autosave = 1
let g:go_imports_autosave = 1
let g:go_mod_fmt_autosave = 1
let g:go_doc_popup_window = 1
let g:ruby_indent_block_style = 'do'
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_host_prog = '/home/joao/.asdf/shims/neovim-ruby-host'
let g:python3_host_prog = "/usr/bin/python3"
let g:python2_host_prog = "/usr/bin/python2"
let g:ale_enabled = 1
let g:ale_linters = { 'go': ['gopls'] }
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'xclip -selection clipboard'

let NERDTreeDirArrowExpandable=""
let NERDTreeDirArrowCollapsible=""
let NERDTreeMinimalUI=1

let g:Lf_ShortcutF = '<C-P>'
let g:Lf_WindowPosition = 'popup'
