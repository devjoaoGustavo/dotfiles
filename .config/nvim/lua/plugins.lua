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
