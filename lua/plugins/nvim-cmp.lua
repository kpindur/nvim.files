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
    mapping = {
      ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<PgUp>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<PgDn>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete({}), { "i", "c" }),
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    },
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
    sources = {
      {
        name = "nvim_lsp",
        group_index = 0,
      },
      {
        name = "nvim_lua",
        group_index = 0,
      },
      {
        name = "vim-dadbod-completion",
        group_index = 0,
      },
      {
        name = "lazydev",
        group_index = 0,
      },
      {
        name = "spell",
        option = {
          enable_in_context = in_spell,
        },
        group_index = 3,
      },
      {
        name = "treesitter",
        keyword_length = 3,
        group_index = 4,
      },
      {
        name = "async_path",
        group_index = 4,
      },
      {
        name = "calc",
        group_index = 4,
      },
      {
        name = "buffer",
        keyword_length = 3,
        group_index = 5,
      },
    },
    sorting = {
      priority_weight = 2,
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
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
