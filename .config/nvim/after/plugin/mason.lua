local setup_mason_lspconfig = require('mason/setup_mason_lspconfig')
local setup_mason_null_ls = require('mason/setup_mason_null_ls')

local mason_ok, mason = pcall(require, 'mason')

if mason_ok then
	mason.setup({})
	setup_mason_lspconfig()
	setup_mason_null_ls()
end
