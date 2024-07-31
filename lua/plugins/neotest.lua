return {
  "nvim-neotest/neotest",
  config = function()
    require("neotest").setup({
      log_level = vim.log.levels.DEBUG,
      adapters = {
        require("rustaceanvim.neotest"),
        require("neotest-plenary"),
      },
    })

    require("config.keymaps").neotest()
  end,
  dependencies = {
    "mrcjkb/rustaceanvim",
    "nvim-neotest/neotest-plenary",
  },
  event = { "BufReadPre", "BufNewFile" },
}
