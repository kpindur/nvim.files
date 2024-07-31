return {
  "benlubas/molten-nvim",
  dependencies = {
    {
      "3rd/image.nvim",
      opts = {
        backend = "kitty",
        max_width = 500,
        max_height = 500,
        max_height_window_percentage = math.huge,
        max_width_window_percentage = math.huge,
        window_overlap_clear_enabled = true,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      },
    },
  },
  build = ":UpdateRemotePlugins",
  -- cmd = "MoltenInit",
  init = function()
    -- these are examples, not defaults. Please see the readme
    vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_output_win_max_height = 500
    vim.g.molten_auto_open_output = true
    vim.g.molten_virt_text_output = true
    vim.g.molten_virt_lines_off_by_1 = true
  end,
}
