vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

require('plugins')
require('plugins.lualine')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.test')

-- Colorscheme
opt('termguicolors', true)
opt('background', 'dark')
cmd [[colorscheme dracula]]
