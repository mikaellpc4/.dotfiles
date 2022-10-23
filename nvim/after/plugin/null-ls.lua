local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettierd.with({ extra_args = { "no-semi", "--sigle" } }),
		formatting.stylua,
		formatting.eslint_d,
		diagnostics.eslint_d,
	},
})
