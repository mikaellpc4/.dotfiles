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

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
