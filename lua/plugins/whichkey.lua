require("which-key").setup {
	{
		plugins = {
			spelling = {
				enabled = true,
				suggestions = 20,
			},
		},
	},
}

local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
			g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
			b = { "<cmd>Telescope buffers<cr>", "Buffers" },
			h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
			l = { "<cmd>Telescope git_files<cr>", "Git Files" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      n = { "<cmd>enew<cr>", "New File" },
    },
    x = {
        name = "+trouble",
        d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document Diagnostics" },
    },
		t = {
			name = "+nvimtree",
			t = { ":NvimTreeToggle<cr>", "Tree Toggle" },
		},
  },
})
