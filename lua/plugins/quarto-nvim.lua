return {
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "nvim-cmp",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      "otter.nvim",
    },
    ft = { "quarto", "markdown" },
    config = function()
      local quarto_nvim = require("quarto")
      print("Checkpoint 1")
      quarto_nvim.setup({
        lspFeatures = {
          languages = { "python" },
          chunks = "all", -- 'curly' or 'all'
          diagnostics = {
            enabled = true,
            triggers = { "BufWritePost" },
          },
          completion = {
            enabled = true,
          },
        },
        codeRunner = {
          enabled = true,
          default_method = "molten",
        },
      })
      require("quarto").activate()
      require('config.keymaps').quarto()
    end,
  },
}
