return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter.configs")

    ts.setup({
      ensure_installed = {
        "markdown",
        "markdown_inline",
        "python",
        "rust",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
    })
  end
}
