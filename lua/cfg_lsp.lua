-- LSP
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = '',
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- completeopt
vim.opt.completeopt = {
  'menuone',        --- popup even when there's only one match
  'noselect',       --- do not select, force to select
  'noinsert'        --- do not insert text until a selection is made
}

vim.opt.shortmess = vim.opt.shortmess + { c = true }  --- avoid showing extra mesages
vim.api.nvim_set_option('updatetime', 300)            --- update time for CursorHold
-- fix column for diagnostics
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- completion
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  -- Installed sources:
  sources = {
    { name = 'path' },                              -- file paths
    { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
    { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
    { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'buffer', keyword_length = 2 },        -- source current buffer
    { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
    { name = 'calc'},                               -- source for math calculation
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },
})

local keymap_otps = { buffer = buffer }
-- Code navigation and shortcuts
vim.keymap.set("n", "<c-]", 	vim.lsp.buf.definition, 			keymap_opts)
vim.keymap.set("n", "K",			vim.lsp.buf.hover,						keymap_opts)
vim.keymap.set("n", "gD", 		vim.lsp.buf.implementation, 	keymap_opts)
vim.keymap.set("n", "<c-k>",	vim.lsp.buf.signature_help, 	keymap_opts)
vim.keymap.set("n", "1gD",		vim.lsp.buf.type_definition,	keymap_opts)
vim.keymap.set("n", "gr", 		vim.lsp.buf.references,				keymap_opts)
vim.keymap.set("n", "gR", 		vim.lsp.buf.rename,						keymap_opts)
vim.keymap.set("n", "g0", 		vim.lsp.buf.document_symbol,	keymap_opts)
vim.keymap.set("n", "gW", 		vim.lsp.buf.workspace_symbol,	keymap_opts)
vim.keymap.set("n", "gd", 		vim.lsp.buf.definition,				keymap_opts)
vim.keymap.set("n", "ga",			vim.lsp.buf.code_action,			keymap_opts)

-- Set updatetime for CursorHold
-- 300ms of no cursor movement to trigger CursorHold
vim.opt.updatetime = 100

-- Show diagnostic popup on cursor hover
local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
   vim.diagnostic.open_float(nil, { focusable = false })
  end,
  group = diag_float_grp,
})

-- Goto previous/next diagnostic warning/error
vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, keymap_opts)
vim.keymap.set("n", "g]", vim.diagnostic.goto_next, keymap_opts)


