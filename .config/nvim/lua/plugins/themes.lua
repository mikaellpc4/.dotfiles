return {
	-- Themes
	{ "drewtempelmeyer/palenight.vim" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		config = function()
			local tokyonight = require("tokyonight")
			tokyonight.setup({
				transparent = true,
			})

			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{ "catppuccin/nvim" },
	{ "Mofiqul/dracula.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
}
