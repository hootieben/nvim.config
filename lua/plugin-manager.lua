--[[
Ensure https://github.com/wbthomason/packer.nvim is cloned inside of the ~/.config/nvim/pack directory.
.
└── pack
    └── packer
        └── start
            └── packer.nvim

Then execute :PackerSync

Plugins will be compiled into the ~/.config/nvim/plugin directory.

NOTE: The plugin mappings defined have the following convention:

* Single <leader> for search operations (inc. file explorer + search/replace)
* Double <leader> for all other mappings

This helps to avoid overlap in letters.
--]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost *.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup({
  function(use)
    -- plugin manager
    use "wbthomason/packer.nvim"

    -- colorschemes
    use({ "dracula/vim",
      as = "dracula",
      config = function()
        vim.cmd 'colorscheme dracula'
      end
    })

    use "rcarriga/nvim-notify"
    --[[ use { "rcarriga/nvim-notify",
      config = function()
        require("notify").setup({
          background_colour = "#000000",
        })
      end
    } ]]

    --[[ use {
      "rcarriga/nvim-notify",
      config = function()
        require("notify").setup()
      end
    } ]]

    -- kitty integration
    use { 'knubie/vim-kitty-navigator' }

    -- make dot operator work in a sensible way
    use "tpope/vim-repeat"

    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("indent_blankline").setup()
      end
    }

    use { 'jiangmiao/auto-pairs' }
    use { 'gpanders/editorconfig.nvim' }

    -- syntax tree parsing for more intelligent syntax highlighting and code navigation
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use { "lewis6991/spellsitter.nvim",
      config = function()
        require("spellsitter").setup()
      end
    }
    use { "m-demare/hlargs.nvim",
      requires = { "nvim-treesitter/nvim-treesitter" },
      config = function()
        require("hlargs").setup()
      end
    }

    -- searching
    use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "nvim-telescope/telescope-ui-select.nvim",
      config = function()
        require("telescope").setup({})
      end
    }
    use "kyoh86/telescope-windows.nvim"
    use "crispgm/telescope-heading.nvim"
    use "xiyaowong/telescope-emoji.nvim"
    use "axkirillov/telescope-changed-files"

    -- pattern searching
    use "mileszs/ack.vim"

    -- search indexer
    -- use "kevinhwang91/nvim-hlslens"
    use { "kevinhwang91/nvim-hlslens",
      config = function()
        require("hlslens").setup()
      end
    }
    use { "haya14busa/vim-asterisk",
      config = function()
        vim.api.nvim_set_keymap('n', '*', [[<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>]], {})
        vim.api.nvim_set_keymap('n', '#', [[<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>]], {})
        vim.api.nvim_set_keymap('n', 'g*', [[<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>]], {})
        vim.api.nvim_set_keymap('n', 'g#', [[<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>]], {})

        vim.api.nvim_set_keymap('x', '*', [[<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>]], {})
        vim.api.nvim_set_keymap('x', '#', [[<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>]], {})
        vim.api.nvim_set_keymap('x', 'g*', [[<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>]], {})
        vim.api.nvim_set_keymap('x', 'g#', [[<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>]], {})
      end
    }

    -- search and replace
    use { "nvim-pack/nvim-spectre", requires = { "nvim-lua/plenary.nvim" } }

    -- file system navigation
    use { "kyazdani42/nvim-tree.lua",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("nvim-tree").setup({
          sync_root_with_cwd = true,
          respect_buf_cwd = true,
          update_focused_file = {
            enable = true,
            update_root = true
          },
          view = {
            adaptive_size = true,
            signcolumn = "no",
            mappings = {
              list = {
                { key = "u", action = "dir_up" },
              },
            },
            float = {
              enable = false
            }
          },
          renderer = {
            indent_markers = {
              enable = true
            }
          },
          git = {
            ignore = false
          }
        })
      end
    }

    use {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup {
          patterns = { "*.tfvars" }
        }
        require('telescope').load_extension('projects')
      end
    }


    -- status line
    use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }

    -- code comments
    use "b3nj5m1n/kommentary"

    -- git change indicator
    use "lewis6991/gitsigns.nvim"

    -- git history
    use { "sindrets/diffview.nvim", requires = { "nvim-lua/plenary.nvim" } }

    use { "kdheepak/lazygit.nvim" }

    -- highlighters and indicators
    use { "RRethy/vim-illuminate", -- word usage highlighter
      config = function()
        -- vim.cmd("highlight illuminatedWord guifg=red guibg=white")
        -- vim.api.nvim_command [[ highlight LspReferenceText guifg=red guibg=white ]]
        -- vim.api.nvim_command [[ highlight LspReferenceWrite guifg=red guibg=white ]]
        -- vim.api.nvim_command [[ highlight LspReferenceRead guifg=red guibg=white ]]
      end
    }
    use { "jinh0/eyeliner.nvim", -- jump to word indictors
      config = function()
        vim.api.nvim_set_hl(0, "EyelinerPrimary", { underline = true })
        vim.api.nvim_create_autocmd("ColorScheme", {
          pattern = {
            "*"
          },
          callback = function()
            vim.api.nvim_set_hl(0, "EyelinerPrimary", { underline = true })
          end
        })
      end
    }
    use "DanilaMihailov/beacon.nvim" -- cursor movement highlighter

    -- modify surrounding characters
    use({
      "kylechui/nvim-surround",
      config = function()
        require("nvim-surround").setup()
      end
    })

    -- camel case motion support
    use "bkad/CamelCaseMotion"

    -- highlight yanked region
    use "machakann/vim-highlightedyank"

    -- move lines around
    -- use "matze/vim-move"

    -- open lines in github
    use { "ruanyl/vim-gh-line",
      config = function()
        vim.g.gh_line_map = "<leader><leader>gl"
      end
    }

    -- suggest mappings
    use { "folke/which-key.nvim",
      config = function()
        require("which-key").setup()
      end
    }

    -- display hex colours
    use { "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end
    }

    -- tab ui improvments
    use { "akinsho/bufferline.nvim",
      tag = "v2.*",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("bufferline").setup({
          options = {
            mode = "tabs"
          }
        })
      end
    }

    -- window picker
    use { "s1n7ax/nvim-window-picker", tag = "v1.*",
      config = function()
        local picker = require("window-picker")
        picker.setup({
          fg_color = "#000000",
        })

        vim.keymap.set("n", "<leader><leader>w", function()
          local picked_window_id = picker.pick_window() or vim.api.nvim_get_current_win()
          vim.api.nvim_set_current_win(picked_window_id)
        end, { desc = "Pick a window" })
      end,
    }

    -- whitespace management
    use { "zakharykaplan/nvim-retrail",
      config = function()
        require("retrail").setup()
      end
    }

    -- buffer scroll context
    use { "nvim-treesitter/nvim-treesitter-context", requires = "nvim-treesitter/nvim-treesitter",
      config = function()
        require("treesitter-context").setup({
          separator = "-",
        })
      end
    }

    use { "folke/neodev.nvim",
      config = function()
        require("neodev").setup({
        })
      end
    }

    -- lsp

    use({
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require("null-ls").setup({
          source = {
            require("null-ls").builtins.code_actions.gitsigns,
            require("null-ls").builtins.code_actions.shellcheck,
            require("null-ls").builtins.completion.luasnip,
            require("null-ls").builtins.diagnostics.cfn_lint,
            require("null-ls").builtins.diagnostics.commitlint,
            require("null-ls").builtins.diagnostics.editorconfig_checker,
            require("null-ls").builtins.diagnostics.golangci_lint,
            require("null-ls").builtins.diagnostics.shellcheck,
            require("null-ls").builtins.diagnostics.yamllint,
            require("null-ls").builtins.diagnostics.zsh,
            require("null-ls").builtins.formatting.jq,
            require("null-ls").builtins.formatting.packer,
            require("null-ls").builtins.formatting.rego,

          }
        })
      end,
      requires = { "nvim-lua/plenary.nvim" },
    })

    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    }
    require("mason").setup()
    require("mason-lspconfig").setup()

    --[[ require("mason").setup()
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = {
        "eslint-lsp",
        "lua-language-server",
        "marksman",
        "terraform-ls",
        "typescript-language-server",
        "yaml-language-server",
        "yamllint",
      }
    })
    mason_lspconfig.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          on_attach = function(client, bufnr)
            require("shared").on_attach(client, bufnr)
            require("illuminate").on_attach(client)
          end
        })
      end
    }) ]]
    use { "j-hui/fidget.nvim",
      config = function()
        require("fidget").setup()
      end
    }
    use { "folke/trouble.nvim",
      config = function()
        require("trouble").setup()
      end
    }
    use({
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- See also: https://github.com/Maan2003/lsp_lines.nvim
      config = function()
        require("lsp_lines").setup()

        -- disable virtual_text since it's redundant due to lsp_lines.
        vim.diagnostic.config({
          virtual_text = false,
        })
      end,
    })
    use { "simrat39/symbols-outline.nvim",
      config = function()
        require("symbols-outline").setup({
          auto_close = true,
        })
      end
    }
    use { "kosayoda/nvim-lightbulb", requires = { "antoinemadec/FixCursorHold.nvim" } }
    use "folke/lsp-colors.nvim"
    use "mfussenegger/nvim-lint"
    use "weilbith/nvim-code-action-menu"
    use "simrat39/rust-tools.nvim"
    use "lvimuser/lsp-inlayhints.nvim" -- rust-tools already provides this feature, but gopls doesn't
    use "onsails/lspkind.nvim"

    -- autocomplete
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    --[[ use { "hrsh7th/cmp-cmdline",
      config = function()
        require("cmp").setup.cmdline(':', {
          sources = {
            { name = 'cmdline' }
          }
        })
      end
    } ]]

    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lsp-signature-help"
    use "hrsh7th/cmp-path"
    use { "L3MON4D3/LuaSnip",
      requires = { "saadparwaiz1/cmp_luasnip" },
      config = function()
        require("luasnip.loaders.from_lua").load({ paths = "~/.snippets" })
      end
    }

    -- debugging
    use "mfussenegger/nvim-dap"
    use { "rcarriga/nvim-dap-ui",
      requires = { "mfussenegger/nvim-dap" },
      config = function()
        require("dapui").setup()
      end
    }
    use { "leoluz/nvim-dap-go",
      requires = { "mfussenegger/nvim-dap" },
      run = "go install github.com/go-delve/delve/cmd/dlv@latest",
      config = function()
        require("dap-go").setup()
      end
    }
    use { "theHamsta/nvim-dap-virtual-text",
      requires = { "mfussenegger/nvim-dap" },
      config = function()
        require("nvim-dap-virtual-text").setup()
      end
    }

    -- swappable arguments and list elements
    use { "mizlan/iswap.nvim",
      config = function()
        require("iswap").setup()
      end
    }

    -- terminal management
    use { "akinsho/toggleterm.nvim",
      tag = "v2.*",
      config = function()
        require("toggleterm").setup()
      end
    }

    -- ui improvements
    use { "stevearc/dressing.nvim",
      config = function()
        require("dressing").setup()
      end
    }

    -- surface any TODO or NOTE code references
    use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup()
      end
    }

    use { "hashivim/vim-terraform" }
  end,
  config = {
    git = {
      clone_timeout = 120
    }
  }
})
