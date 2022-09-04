require'lualine'.setup {
  options = {
    theme = 'dracula'
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 3
      }
    }
  }
}
