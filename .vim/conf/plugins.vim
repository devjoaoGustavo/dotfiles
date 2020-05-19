call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'

" PRODUCTIVITY
Plug 'wakatime/vim-wakatime'
Plug 'tricktux/vim-pomodoro'

" STYLES
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'flrnprz/plastic.vim'

" FILES
" Plug 'christoomey/vim-tmux-navigator'
Plug 'jremmen/vim-ripgrep'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'git@github.com:PhilRunninger/bufselect.vim.git'

" GIT
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" LANGUAGES
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
" Plug 'Thinca/vim-quickrun'
Plug 'mattn/webapi-vim'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'mattn/emmet-vim', { 'for': ['html', 'eruby'] }
Plug 'hashivim/vim-terraform'
Plug 'jiangmiao/auto-pairs'
call plug#end()

packadd! matchit

