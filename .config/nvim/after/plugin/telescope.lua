require('telescope').setup({
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				['<C-h>'] = 'which_key',
			},
		},
	},
	pickers = {},
	extensions = {
		file_browser = {
			hidden = true,
			initial_mode = 'normal',
			grouped = true,
			theme = 'ivy',
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				['i'] = {
					-- your custom insert mode mappings
				},
				['n'] = {
					-- your custom normal mode mappings
				},
			},
		},
	},
})

require('telescope').load_extension('harpoon')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('media_files')