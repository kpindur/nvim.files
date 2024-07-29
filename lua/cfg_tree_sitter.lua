local status, tree_sitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- tree-sitter
tree_sitter.setup {
  ensure_installed = { "lua", "rust", "toml", "typst" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
  },
  ident = { enable = true }, 
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

-- Does not work for the time being
-- tree-sitter folding
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
