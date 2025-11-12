return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons", "refractalize/oil-git-status.nvim" },
	config = function()
		require("oil").setup({
			keymaps = {
				["<C-h>"] = false,
				["<C-l>"] = false,
			},
			default_file_explorer = true,
			win_options = {
				signcolumn = "yes:2",
			},
		})

		require("oil-git-status").setup()
	end,
}
