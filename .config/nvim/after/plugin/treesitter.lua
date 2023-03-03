require('nvim-treesitter.configs').setup({
	ensure_installed = {
		'c',
		'lua',
		'vim',
		'help',
		'markdown',
		'markdown_inline',
	},
	auto_install = true,
	sync_install = false,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = {},
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
