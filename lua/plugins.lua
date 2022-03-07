vim.g.loaded_netrwPlugin = false
vim.cmd [[packadd cfilter]]

require("packer").startup {
  function()
    use {
      "lewis6991/impatient.nvim",
      config = function()
        require("impatient")
      end,
    }

    use "wbthomason/packer.nvim"

    use {
    "lukas-reineke/onedark.nvim",
    config = function()
        require("onedark").setup {}
    end,
    }

    use {
      "dracula/vim",
      as = "dracula",
    }
    use "ray-x/lsp_signature.nvim"

    use {
        "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-cmdline" },
            { "lukas-reineke/cmp-under-comparator" },
            { "lukas-reineke/cmp-rg" },
            { "octaltree/cmp-look" },
        },
        config = function()
            local cmp = require "cmp"
            cmp.setup {
                preselect = cmp.PreselectMode.None,
                completion = {
                    keyword_length = 0,
                    autocomplete = false,
                },

                mapping = {
                    ["<C-d>"] = cmp.mapping.scroll_docs(-5),
                    ["<C-f>"] = cmp.mapping.scroll_docs(5),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<CR>"] = function(fallback)
                        if cmp.visible() then
                            return cmp.mapping.confirm {
                                behavior = cmp.ConfirmBehavior.Insert,
                                select = true,
                            }(fallback)
                        else
                            return fallback()
                        end
                    end,
                    ["<C-n>"] = function(fallback)
                        if cmp.visible() then
                            return cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }(fallback)
                        else
                            return cmp.mapping.complete { reason = cmp.ContextReason.Auto }(fallback)
                        end
                    end,
                    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                },

                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },

                sorting = {
                    priority_weight = 100,
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.score,
                        require("cmp-under-comparator").under,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },

                sources = {
                    { name = "path", priority_weight = 110 },
                    { name = "nvim_lsp", max_item_count = 20, priority_weight = 100 },
                    { name = "nvim_lua", priority_weight = 90 },
                    { name = "luasnip", priority_weight = 80 },
                    { name = "buffer", max_item_count = 5, priority_weight = 70 },
                    {
                        name = "rg",
                        keyword_length = 5,
                        max_item_count = 5,
                        priority_weight = 60,
                        option = {
                            additional_arguments = "--smart-case --hidden",
                        },
                    },
                    { name = "tmux", max_item_count = 5, option = { all_panes = false }, priority_weight = 50 },
                    {
                        name = "look",
                        keyword_length = 5,
                        max_item_count = 5,
                        opion = { convert_case = true, loud = true },
                        priority_weight = 40,
                    },
                },

                formatting = {
                    format = function(entry, vim_item)
                        local menu_map = {
                            gh_issues = "[Issues]",
                            buffer = "[Buf]",
                            nvim_lsp = "[LSP]",
                            nvim_lua = "[API]",
                            path = "[Path]",
                            luasnip = "[Snip]",
                            tmux = "[Tmux]",
                            look = "[Look]",
                            rg = "[RG]",
                        }
                        vim_item.menu = menu_map[entry.source.name] or string.format("[%s]", entry.source.name)

                        vim_item.kind = vim.lsp.protocol.CompletionItemKind[vim_item.kind]
                        return vim_item
                    end,
                },

                documentation = {
                    border = vim.g.floating_window_border_dark,
                },

                experimental = {
                    native_menu = false,
                    ghost_text = true,
                },
            }
            cmp.setup.cmdline(":", {
                sources = {
                    { name = "cmdline" },
                },
            })
        end,
      }
  end,
  config = {
    display = {
        open_fn = function()
            return require("packer.util").float { border = vim.g.floating_window_border }
        end,
    },
  },
}
