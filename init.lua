vim.o.completeopt = 'menu,menuone,noselect,noinsert'
vim.o.number = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

opt('signcolumn', 'yes:1', window)

require('plugins')
require('config.lualine')
require('config.treesitter')
require('config.lsp')
require('config.test')

-- Colorscheme
opt('termguicolors', true)
opt('background', 'dark')
cmd [[colorscheme dracula]]
