vim.o.completeopt = 'menu,menuone,noselect,noinsert'
vim.o.mouse = 'nv'
vim.o.number = true
vim.o.tabstop = 2
vim.o.softtabstop = 2 
vim.o.shiftwidth = 2 
vim.o.expandtab = true
vim.o.clipboard = 'unnamed'
vim.o.spell = false
vim.o.spelllang = 'en_us'
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.o.showcmd = true
vim.o.signcolumn = 'number'
vim.o.swapfile = false
vim.o.foldenable = false
vim.o.hidden = true

require('plugins')
require('plugins.cmp')
require('plugins.lsp')
require('plugins.treesitter')
require('plugins.lightline')
require('plugins.trouble')
require('plugins.autopairs')
require('plugins.kommentary')
require('plugins.telescope')
require('plugins.test')
require('plugins.nvimtree')

require('plugins.whichkey')

vim.cmd [[colorscheme onedark]]

vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
vim.cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
vim.cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

require('bufferline').setup{}

vim.api.nvim_set_keymap('n', '<C-l>', ':noh<CR>', { noremap = true, nowait = true, silent = true })
--vim.api.nvim_set_keymap('t', '<C-o>', '<C-\\><C-n>', { noremap = true, nowait = true, silent = true })
