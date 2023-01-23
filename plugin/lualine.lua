require("lualine").setup({
  options = {
    theme = "dracula",
    disabled_filetypes = {
      statusline = { "NvimTree" }
    }
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 3
      }
    }
  }
})
