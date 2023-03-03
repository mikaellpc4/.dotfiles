local on_attach_lspsaga = function(client, bufnr)
	local nnoremap = require('keymap').nnoremap
	local opts = { buffer = bufnr }

	-- local inoremap = require('keymap').inoremap

	-- Old keymaps
	-- nnoremap('<S-k>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>')
	-- nnoremap('<S-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>')
	-- nnoremap('K', '<Cmd>Lspsaga hover_doc<CR>')
	-- nnoremap('gd', '<Cmd>Lspsaga lsp_finder<CR>')
	-- inoremap('<S-k>', '<Cmd>Lspsaga signature_help<CR>')
	-- nnoremap('gp', '<Cmd>Lspsaga peek_definition<CR>')
	-- nnoremap('gr', '<Cmd>Lspsaga rename<CR>')

	nnoremap('gf', '<cmd>Lspsaga lsp_finder<CR>', opts) -- show definition, references
	nnoremap('gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts) -- got to declaration
	nnoremap('gd', '<cmd>Lspsaga peek_definition<CR>', opts) -- see definition and make edits in window
	nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- go to implementation
	nnoremap('<leader>ca', '<cmd>Lspsaga code_action<CR>', opts) -- see available code actions
	nnoremap('<leader>rn', '<cmd>Lspsaga rename<CR>', opts) -- smart rename
	nnoremap('<leader>D', '<cmd>Lspsaga show_line_diagnostics<CR>', opts) -- show  diagnostics for line
	nnoremap('<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts) -- show diagnostics for cursor
	nnoremap('[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts) -- jump to previous diagnostic in buffer
	nnoremap(']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts) -- jump to next diagnostic in buffer
	nnoremap('K', '<cmd>Lspsaga hover_doc<CR>', opts) -- show documentation for what is under cursor
	nnoremap('<leader>o', '<cmd>Lspsaga outline<CR>', opts) -- see outline on right hand side

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == 'tsserver' then
		nnoremap('<leader>rf', ':TypescriptRenameFile<CR>') -- rename file and update imports
		nnoremap('<leader>oi', ':TypescriptOrganizeImports<CR>') -- organize imports (not in youtube nvim video)
		nnoremap('<leader>ru', ':TypescriptRemoveUnused<CR>') -- remove unused variables (not in youtube nvim video)
	end
end

return on_attach_lspsaga
