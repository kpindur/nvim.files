local function config()
  local cmp = require("cmp")
  local context = require("cmp.config.context")

  local function in_comment()
    return context.in_treesitter_capture("comment") or context.in_syntax_group("Comment")
  end

  local function in_string()
    return context.in_treesitter_capture("string") or context.in_syntax_group("String")
  end

  local function in_spell()
    return context.in_treesitter_capture("spell")
  end

  local function disallowed_buftype()
    local buftype = vim.bo.buftype
    local disallowed = {
      "prompt",
      "nofile",
    }
    for _, v in pairs(disallowed) do
      if buftype == v then
        return true
      end
    end
    return false
  end

  cmp.setup({
    enabled = function()
      return not in_comment() and not disallowed_buftype()
    end,
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

  cmp.setup.cmdline("/", {
    sources = {
      { name = "buffer" },
    },
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "mysql,plsql",
    callback = function()
      require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
    end,
  })
end

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "FelipeLema/cmp-async-path",
    "f3fora/cmp-spell",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline",
    "onsails/lspkind.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- "ray-x/cmp-treesitter",
    -- "saadparwaiz1/cmp_luasnip",
  },
  event = "InsertEnter",
  config = config,
}
