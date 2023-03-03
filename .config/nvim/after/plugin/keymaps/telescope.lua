local nnoremap = require('keymap').nnoremap

nnoremap('<C-p>', ':Telescope<CR>')

-- File Browser
nnoremap('<leader>fb', ':Telescope file_browser<CR>')

nnoremap('<Leader>pf', function()
	require('telescope.builtin').find_files()
end)

nnoremap('<Leader>pm', function()
	require('telescope').extensions.media_files.media_files()
end)

nnoremap('<leader>pw', function()
	require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })
end)
nnoremap('<leader>pb', function()
	require('telescope.builtin').buffers()
end)
nnoremap('<leader>vh', function()
	require('telescope.builtin').help_tags()
end)
