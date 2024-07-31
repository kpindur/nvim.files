local opts = {
  ensure_installed = {
    -- Lua
    "lua_ls",
    -- Rust
    "rust_analyzer",
    -- C & C++
    "clangd",
    -- Python
    "pyright",
    -- Zig
    "zls",
  },
  automatic_installation = true,
}

return {
  "williamboman/mason-lspconfig.nvim",
  opts = opts,
  dependencies = "williamboman/mason.nvim",
}
