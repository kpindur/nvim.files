return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Configuration for Yuck
        yamlls = {
          filetypes = { "yuck" },
          settings = {
            yaml = {
              schemas = {
                ["https://raw.githubusercontent.com/elkowar/eww/master/schemas/eww.json"] = "/*.yuck",
              },
            },
          },
        },
        -- Configuration for SCSS
        cssls = {
          filetypes = { "css", "scss", "less" },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "yaml-language-server", -- for Yuck
        "css-lsp",              -- for SCSS
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "css",
        "scss",
      },
    },
  },
}
