local config = function()
  local actions = require("telescope.actions")
  local telescope = require("telescope")

  telescope.setup({
    defaults = {
      file_ignore_patterns = { "node_modules" },
      mappings = {
        i = {
          ["<ESC>"] = actions.close,
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      layout_config = {
        horizontal = {
          preview_width = 0.6,
          width = { padding = 5 },
        },
      },
      path_display = {
        "filename_first",
      },
    },
  })

  telescope.load_extension("fzf")
end

local function normal_keymaps(builtin)
  return {
    ['<leader>ff'] = builtin.find_files,
    ['<leader>fg'] = builtin.live_grep,
    ['<leader>fb'] = builtin.buffers,
    ['<leader>fh'] = builtin.help_tags,
  }
end

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-treesitter/nvim-treesitter",
    "rachartier/tiny-devicons-auto-colors.nvim",
  },
  config = config,
  opts = {},
}
