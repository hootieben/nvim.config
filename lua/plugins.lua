return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- sensible defaults
  use 'tpope/vim-sensible'

  -- fzf
  use { 'junegunn/fzf' }
  use { 'junegunn/fzf.vim' }
  use { 'ojroques/nvim-lspfuzzy' }

  -- ui
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'tjdevries/colorbuddy.nvim' }
  use { 'olimorris/onedarkpro.nvim' }
  use { 'akinsho/nvim-bufferline.lua' }
  use { 'itchyny/lightline.vim' }
  use { 'folke/trouble.nvim' }
	use 'kyazdani42/nvim-tree.lua'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} }
  }

  -- lsp
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/nvim-lsp-installer' }
  use { 'nvim-lua/lsp-status.nvim' }
  -- use { 'hrsh7th/cmp-vsnip', requires = 'hrsh7th/nvim-cmp' }
  -- use { 'hrsh7th/vim-vsnip' }
  use { 'hrsh7th/cmp-path', requires = 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp', requires = 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-buffer', requires = 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'onsails/lspkind-nvim' }
  use { 'SirVer/ultisnips' }
  use { 'quangnguyen30192/cmp-nvim-ultisnips' }
  
  use { 'windwp/nvim-autopairs' }
  use { 'josa42/nvim-lightline-lsp', requires = 'itchyny/lightline.vim' }
  use { 'RRethy/nvim-treesitter-textsubjects' }
  use { 'lewis6991/spellsitter.nvim' }

  use { 'ahmedkhalf/project.nvim' }

  -- utils
  use { 'nvim-lua/plenary.nvim' }
  use { 'tpope/vim-abolish' } -- better substitution
  use { 'tpope/vim-surround' }
  use { 'b3nj5m1n/kommentary' } 
  use { 'jeffkreeftmeijer/vim-numbertoggle' }
  use 'folke/which-key.nvim'

  -- kitty
  use 'knubie/vim-kitty-navigator'

	-- Direnv
	use 'direnv/direnv.vim'

  -- go
  use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
  use { 'sebdah/vim-delve' }
  use { 'vim-test/vim-test'}
end)
