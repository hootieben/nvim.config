local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer'
  }

  -- Pretty symbols
  use 'kyazdani42/nvim-web-devicons'

  -- Trouble
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Indentation
  use 'lukas-reineke/indent-blankline.nvim'

  -- testing
  use { 'vim-test/vim-test'}

  -- Git
  use { 'tpope/vim-fugitive' }

  use {
    'tpope/vim-rhubarb',
    requires = 'tpope/vim-fugitive',
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- go
  use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
  use { 'sebdah/vim-delve' }


  -- Color scheme
  use {
    'dracula/vim',
    as = 'dracula'
  }

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
