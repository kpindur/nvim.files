local function config()
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local keymaps = require("config.keymaps")
  local lsp_status = require("lsp-status")
  local lspconfig = require("lspconfig")
  local mason_lspconfig = require("mason-lspconfig")

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      keymaps.lsp_buf(client, bufnr)
      lsp_status.on_attach(client)
    end,
  })

  vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
      scope = "cursor",
    },
  })

  -- keymaps.global_lsp()

  vim.lsp.inlay_hint.enable(true)

  lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, {
    capabilities = capabilities,
  })

  vim.g.rustaceanvim = {
    tools = {},
    server = {
      default_settings = {
        ["rust-analyzer"] = {
          diagnostics = {
            disabled = { "unresolved-proc-macro" },
          },
          checkOnSave = {
            extraArgs = { "--target-dir", "/tmp/rust-analyzer-check", "--", "-A", "clippy::needless_return" },
            command = "clippy",
          },
        },
      },
    },
    dap = {},
  }
  
  lspconfig.pyright.setup({
    settings = {
          python = {
              analysis = {
                  autoImportCompletions = true,
              },
	      plugins = {
          pylint = { enabled = true, executable = "pylint" },
          mypy = { enabled = true },
	      },
          }
      }
  })

  -- Dynamic server setup, so we don't have to explicitly list every single server
  -- and can just list the ones we want to override configuration for.
  -- See :help mason-lspconfig-dynamic-server-setup
  mason_lspconfig.setup_handlers({
    function(server)
      -- Depend on rustaceanvim to setup `rust_analyzer`.
      -- We're not allowed to call `setup` ourselves.
      if server ~= "rust_analyzer" then
        lspconfig[server].setup({})
      end
    end,
    ["clangd"] = function()
      lspconfig.clangd.setup({
        filetypes = { "c", "cpp" }, -- we don't want objective-c and objective-cpp!
      })
    end,
  })
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    -- "onsails/lspkind-nvim",
    "ahmedkhalf/lsp-rooter.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "mrcjkb/rustaceanvim",
    "kosayoda/nvim-lightbulb",
    "nvim-lua/lsp-status.nvim",
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      config = false,
    },

    -- Should consider...
    "windwp/nvim-autopairs",
    -- "kevinhwang91/nvim-ufo",
    -- "VidocqH/lsp-lens.nvim",
    -- "jubnzv/virtual-types.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
}
