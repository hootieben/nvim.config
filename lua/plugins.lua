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

    -- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
    use({ "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('config.lsp')]] })

    use({ "nvim-treesitter/nvim-treesitter", event = 'BufEnter', run = ":TSUpdate", config = [[require('config.treesitter')]] })

    use({"mhinz/vim-signify", event = 'BufEnter'})

    use {'kyazdani42/nvim-web-devicons', event = 'VimEnter'}

    use {
      'nvim-lualine/lualine.nvim',
      event = 'VimEnter',
      config = [[require('config.lualine')]]
    }

    use({ "akinsho/bufferline.nvim", event = "VimEnter", config = [[require('config.bufferline')]] })

    use({
      "lukas-reineke/indent-blankline.nvim",
      event = 'VimEnter',
      config = [[require('config.indent-blankline')]]
    })
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
