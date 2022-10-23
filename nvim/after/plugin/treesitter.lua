require("nvim-treesitter.configs").setup({
	sync_install = false,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = "all",
})
