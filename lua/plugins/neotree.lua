return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
    opts = {
      window = {
        mapping_options = { noremap = true, nowait = true },
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          ["!"] = "toggle_hidden",
          ["d"] = "add_directory",
          ["X"] = "delete",
          ["/"] = "noop",
          ["?"] = "noop",
          ["space"] = "none",
          ["<Esc>"] = "close_window",
        },
        filesystem = {
          hijack_netrw_behavior = "disabled",
        },
      },
      cmd = "Neotree"
    }
}
