local utils = require("utils")
local fn = vim.fn

vim.g.package_home = fn.stdpath("data") .. "/site/pack/packer/"
local packer_install_dir = vim.g.package_home .. "/opt/packer.nvim"

local plug_url_format = "https://github.com/%s"
local packer_repo = string.format(plug_url_format, "wbthomason/packer.nvim")

local install_cmd = string.format("10split |term git clone --depth=1 %s %s", packer_repo, packer_install_dir)

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_install_dir) == "" then
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  vim.cmd(install_cmd)
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")
local util = require('packer.util')

require("packer").startup({
  function(use)
    -- it is recommened to put impatient.nvim before any other plugins
    use {'lewis6991/impatient.nvim', config = [[require('impatient')]]}

    use({"wbthomason/packer.nvim", opt = true})

    use {"onsails/lspkind-nvim", event = "BufEnter"}

    use {"hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('config.nvim-cmp')]]}

    -- nvim-cmp completion sources
    use {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"}
    use {"hrsh7th/cmp-nvim-lua", after = "nvim-cmp"}
    use {"hrsh7th/cmp-path", after = "nvim-cmp"}
    use {"hrsh7th/cmp-buffer", after = "nvim-cmp"}
    -- use {"hrsh7th/cmp-cmdline", after = "nvim-cmp"}
    use {"quangnguyen30192/cmp-nvim-ultisnips", after = {'nvim-cmp', 'ultisnips'}}

    -- Snippet engine and snippet template
    use({"SirVer/ultisnips", event = 'InsertEnter'})
    use({ "honza/vim-snippets", after = 'ultisnips'})

    -- Show match number and index for searching
    use {
      'kevinhwang91/nvim-hlslens',
      branch = 'main',
      keys = {{'n', '*'}, {'n', '#'}, {'n', 'n'}, {'n', 'N'}},
      config = [[require('config.hlslens')]]
    }

    use {
      'nvim-telescope/telescope.nvim', cmd = 'Telescope',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Stay after pressing * and search selected text
    use({"haya14busa/vim-asterisk", event = 'VimEnter'})

    -- File search, tag search and more
    use({ "Yggdroot/LeaderF", cmd = "Leaderf", run = ":LeaderfInstallCExtension" })

    -- Automatic insertion and deletion of a pair of characters
    use({"Raimondi/delimitMate", event = "InsertEnter"})

    -- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
    use({ "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('config.lsp')]] })

    use({ "nvim-treesitter/nvim-treesitter", event = 'BufEnter', run = ":TSUpdate", config = [[require('config.treesitter')]] })

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
    use({ "rbong/vim-flog", requires = "tpope/vim-fugitive", cmd = { "Flog" } })
    use({"rhysd/committia.vim", opt = true, setup = [[vim.cmd('packadd committia.vim')]]})

    use({ "kevinhwang91/nvim-bqf", event = "FileType qf", config = [[require('config.bqf')]] })

    if utils.executable("fzf") then
      use { 'junegunn/fzf'}
    end

    -- Color scheme
    use ({"dracula/vim", as = "dracula", opt=true})

    use {'kyazdani42/nvim-web-devicons', event = 'VimEnter'}

    use {
      'nvim-lualine/lualine.nvim',
      event = 'VimEnter',
      config = [[require('config.lualine')]]
    }

    use({ "akinsho/bufferline.nvim", event = "VimEnter", config = [[require('config.bufferline')]] })

    -- fancy start screen
    use { 'goolord/alpha-nvim', event = 'VimEnter', config = [[require('config.alpha-nvim')]] }

    use({
      "lukas-reineke/indent-blankline.nvim",
    })

    -- notification plugin
    use({
      "rcarriga/nvim-notify",
      event = "BufEnter",
      config = function()
        vim.defer_fn(function() require('config.nvim-notify') end, 2000)
      end
    })

    -- Go
    use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
    use { 'sebdah/vim-delve', after = 'vim-go' }

    -- Kitty Integration
    use { 'knubie/vim-kitty-navigator' }

    -- Direnv
    if utils.executable("direnv") then
      use { 'direnv/direnv.vim'}
    end

    -- Kommentary
    use { 'b3nj5m1n/kommentary'}

    -- Modern matchit implementation
    use({"andymass/vim-matchup", event = "VimEnter"})

    -- The missing auto-completion for cmdline!
    use({"gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]]})

    -- showing keybindings
    use {"folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function() require('config.which-key') end, 2000)
    end
    }

  end,
  config = {
    max_jobs = 16,
    compile_path = util.join_paths(vim.fn.stdpath('config'), 'lua', 'packer_compiled.lua'),
    git = {
      default_url_format = plug_url_format,
    },
  },
})

local status, _ = pcall(require, 'packer_compiled')
if not status then
  vim.notify("Error requiring packer_compiled.lua: run PackerSync to fix!")
end
