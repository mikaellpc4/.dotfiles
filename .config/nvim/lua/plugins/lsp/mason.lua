return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local lspconfig = require("lspconfig")

		local servers = {
			phpactor = {
				root_dir = function(_, on_dir)
					on_dir(vim.fn.getcwd())
				end,
				init_options = {
					["language_server_phpstan.enabled"] = true,
					["language_server_psalm.enabled"] = true,
				},
			},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			},
			cssls = {
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
			},
			bashls = {
				filetypes = { "sh", "bash", "zsh", "make" },
				root_dir = lspconfig.util.root_pattern(".git", "Makefile"),
			},
		}

		for server, config in pairs(servers) do
			config.capabilities = vim.tbl_deep_extend("force", capabilities, config.capabilities or {})
			vim.lsp.config(server, config)
		end

		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})

		require("mason-lspconfig").setup({
			ensure_installed = ensure_installed,
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
			},
		})
	end,
}
