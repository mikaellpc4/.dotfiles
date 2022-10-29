require('toggleterm').setup({
	size = 20,
	direction = 'float',
	float_opts = {
		width = 100,
		height = 20,
	},
	open_mapping = [[<c-\>]],
	start_in_insert = true,
	insert_mappings = true,
	close_on_exit = true,
})
