return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "eslint", "prettier" },
				typescript = { "eslint", "prettier" },
				javascriptreact = { "eslint", "prettier" },
				typescriptreact = { "eslint", "prettier" },
				svelte = { "eslint", "prettier" },
				css = { "eslint", "prettier" },
				html = { "eslint", "prettier" },
				json = { "eslint", "prettier" },
				yaml = { "eslint", "prettier" },
				markdown = { "eslint", "prettier" },
				graphql = { "eslint", "prettier" },
				lua = { "stylua" },
				-- python = { "isort", "black" },
			},
		})
	end,
}
