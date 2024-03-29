return {
  -- LSP
  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      { "neovim/nvim-lspconfig" },          -- Required
      { "mfussenegger/nvim-jdtls" },        -- Optional
      { "williamboman/mason.nvim" },        -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional
      { "hrsh7th/nvim-cmp" },               -- Required
      { "hrsh7th/cmp-nvim-lsp" },           -- Required
      { "hrsh7th/cmp-path" },               -- Optional
      { "L3MON4D3/LuaSnip" },               -- Required
      { "saadparwaiz1/cmp_luasnip" },       -- Optional
      { "rafamadriz/friendly-snippets" },   -- Optional
      { "creativenull/efmls-configs-nvim" },
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      local lspconfig = require("lspconfig")

      lsp_zero.on_attach(function(_, bufnr)
        local opts = { buffer = bufnr, remap = false }
        lsp_zero.default_keymaps({
          buffer = bufnr,
          preserve_mappings = false,
        })

        vim.keymap.set("n", "gd", function()
          vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "K", function()
          vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set("n", "<leader>vws", function()
          vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set("n", "<leader>vd", function()
          vim.diagnostic.open_float()
        end, opts)
        vim.keymap.set("n", "]d", function()
          vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set("n", "[d", function()
          vim.diagnostic.goto_prev()
        end, opts)
        vim.keymap.set("n", "<leader>ca", function()
          vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set("n", "<leader>vrr", function()
          vim.lsp.buf.references()
        end, opts)
        vim.keymap.set("n", "<leader>vrn", function()
          vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set("i", "<C-h>", function()
          vim.lsp.buf.signature_help()
        end, opts)
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
      end)

      local cmp = require("cmp")
      local cmp_action = require("lsp-zero").cmp_action()
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          -- Confirm completion
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),

          -- Trigger auto suggestion
          ["<C-Space>"] = cmp.mapping.complete(),

          -- Navigate between snippet placeholder
          ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          ["<C-b>"] = cmp_action.luasnip_jump_backward(),

          -- Scroll up and down in the completion documentation
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "cmp_tabnine" },
          { name = "path" },
        },
      })

      lsp_zero.set_preferences({
        sign_icons = {},
      })

      lspconfig.efm.setup({
        init_options = {
          documentFormatting = true,
          documentRangeFormatting = true,
          hover = true,
          documentSymbol = true,
          codeAction = true,
          completion = true,
        },
        settings = {
          rootMarkers = { ".git/" },
        },
        filetypes = { "python", "cpp", "lua", "html" },
      })

      local languages = require("efmls-configs.defaults").languages()

      local efmls_config = {
        filetypes = vim.tbl_keys(languages),
        settings = {
          rootMarkers = { ".git/" },
          languages = languages,
        },
        init_options = {
          documentFormatting = true,
          documentRangeFormatting = true,
        },
      }

      require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {}))

      lspconfig.html.setup({
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
        end,
      })

      lspconfig.cssls.setup({
        settings = {
          css = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
          scss = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
          less = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
        },
      })

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
          },
        },
      })

      lspconfig.eslint.setup({
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = true
        end,
      })

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = { "jdtls" },
        handlers = {
          lsp_zero.default_setup,
          jdtls = function() end,
        },
      })
      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb" },
        handlers = {
          function(config)
            -- all sources with no handler get passed here

            -- Keep original functionality
            require("mason-nvim-dap").default_setup(config)
          end,
        },
      })
    end,
  },
}
