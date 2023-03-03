local mason_ok, mason = pcall(require, 'mason')

local setup_mason_lspconfig_ok, setup_mason_lspconfig = pcall(require, 'mason/setup_mason_lspconfig')
local setup_mason_null_ls_ok, setup_mason_null_ls = pcall(require, 'mason/setup_mason_null_ls')
local on_attach_lspsaga_ok, on_attach_lspsaga = pcall(require, 'mason/on_attach_lspsaga')

if mason_ok and setup_mason_lspconfig_ok and setup_mason_null_ls_ok and on_attach_lspsaga_ok then
  mason.setup({})
  setup_mason_lspconfig(on_attach_lspsaga)
  setup_mason_null_ls()
end
