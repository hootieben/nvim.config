require('project_nvim').setup{
  detection_methods = { "pattern", "lsp"},
  silent_chdir = false
}
require('telescope').load_extension('projects')
