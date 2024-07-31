local opts = {
  ensure_installed = {
    -- Nvim related
    "lua_ls",
    -- Rust
    "rust_analyzer",
    -- Other programming
    "clangd",
    "pylsp",
    "zls",
  },
  automatic_installation = true,
}

return {
  "williamboman/mason-lspconfig.nvim",
  opts = opts,
  dependencies = "williamboman/mason.nvim",
}
