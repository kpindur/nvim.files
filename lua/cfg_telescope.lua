-- telescope related setup
local telescope = require "telescope"

telescope.setup {
  defaults = {
    mappings = { n = { ["o"] = require("telescope.actions").select_default }},
    initial_mode = "normal",
    file_ignore_patterns = { "dist/", ".git/", "node_moeduls/", "target/" },
  },
  pickers = { find_files = { hidden = true }},
  extensions = { file_browser = { hidden = true }},
}

telescope.load_extension "file_browser"
