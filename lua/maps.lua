
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("", "<A>", "<Nop>", opts)
vim.g.mapleader = "<A>"

keymap("n", "<A-l>", ":bprevious<CR>", opts)
keymap("n", "<A-h>", ":bnext<CR>", opts)

-- keymap(? {"n", "v"}, "key" "action", options)
--keymap("n", "<leader>x", vim.diagnostic.open_float)
--
--keymap("n", "k", "v:count == 0 ? \"gk\" : \"k\"", {expr = true, silent = true})
--keymap("n", "j", "v:count == 0 ? \"gj\" : \"j\"", {expr = true, silent = true})
--
--keymap("n", "<Leader>l", ":vsplit term://fish <CR>", {silent = true})
--keymap("t", "<Leader><Esc>", "<C-\\><C-n>", {silent = true})


-- Other options

vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
vim.o.lazyredraw = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.termguicolors = true
vim.o.updatetime = 100

--vim.o.highlight Normal guibg=none
--vim.o.highlight NonText guibg=none
--vim.o.highlight Normal ctermbg=none
--vim.o.highlight NonText ctermbg=none

local lang_maps = {
  python = { exec = "python %" },
  sh = { exec = "./%" },
  rust = { exec = "cargo run" },
	zig = { exec = "zig build"},
}

for lang, data in pairs(lang_maps) do 
  if data.build ~= nil then
    vim.api.nvim_create_autocmd(
      "FileType",
      { command = "nnoremap <leader>b :!" .. data.build .. "<CR>", pattern = lang }
    )
  end
  vim.api.nvim_create_autocmd(
    "FileType",
    { command = "nnoremap <leader>e :split<CR>:ter" .. data.exec .. "<CR>", pattern = lang }
  )
end

--vim.api.nvim_create_autocmd("BufWritePre", {
--  command = "lua vim.lsp.buf.formatting_sync(nil, 1000)",
--  pattern = "*.rs"
--})
