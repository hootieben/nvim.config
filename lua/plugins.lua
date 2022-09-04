return require('packer').startup(function(use)
  use 'lewis6991/impatient.nvim'

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use ({"dracula/vim",
    as = "dracula",
    config = function()
      vim.cmd 'colorscheme dracula'
    end
  })

  use {
    'nvim-lualine/lualine.nvim',
    config = [[require('config.lualine')]]
  }

--  use { "akinsho/bufferline.nvim",
--    tag = "v2.*",
--    requires = {
--      'kyazdani42/nvim-web-devicons'
--    },
--    config = function()
--      require('config.bufferline')
--    end
--  }

  use { 'folke/lsp-colors.nvim' }

  use {'kyazdani42/nvim-web-devicons'}

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  }

  use({
    'ray-x/navigator.lua',
    requires = {
        { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
        { 'neovim/nvim-lspconfig' },
        { 'ray-x/lsp_signature.nvim' },
    },
    config = function()
      require('navigator').setup {}
    end
  })


  use { 'tpope/vim-fugitive' }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }
end)
