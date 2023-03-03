local setup_mason_lspconfig = function(on_attach_lspsaga)
	local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
	local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')

	if lspconfig_ok and mason_lspconfig_ok then
		mason_lspconfig.setup({
			ensure_installed = {
				'tsserver',
				'html',
				'cssls',
				'tailwindcss',
				'lua_ls',
				'emmet_ls',
				'graphql',
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()

		local cmp_lsp_ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')

		if cmp_lsp_ok then
			capabilities = cmp_lsp.default_capabilities()
		end

		mason_lspconfig.setup_handlers({
			-- default handler
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach_lspsaga,
				})
			end,
			-- overrides
			['lua_ls'] = function()
				lspconfig.lua_ls.setup({
					capabilities = capabilities,
					on_attach = on_attach_lspsaga,
					settings = {
						Lua = {
							diagnostics = {
								globals = { 'vim' },
							},
							format = {
								enable = true,
								defaultConfig = {
									quote_style = 'single',
									trailing_table_separator = 'smart',
								},
							},
						},
					},
				})
			end,
			['emmet_ls'] = function()
				lspconfig.emmet_ls.setup({
					capabilities = capabilities,
					on_attach = on_attach_lspsaga,
					filetypes = { 'html', 'css', 'eruby', 'css', 'sass', 'scss', 'less', 'js', 'jsx', 'ts', 'tsx' },
				})
			end,
			['eslint'] = function()
				lspconfig.eslint.setup({
					capabilities = capabilities,
					on_attach = on_attach_lspsaga,
					codeAction = {
						code_actions = {
							enable = true,
							apply_on_save = {
								enable = true,
								types = { 'problem' }, -- "directive", "problem", "suggestion", "layout"
							},
							disable_rule_comment = {
								enable = true,
								location = 'separate_line', -- or `same_line`
							},
						},
						diagnostics = {
							enable = true,
							report_unused_disable_directives = false,
							run_on = 'type', -- or `save`
						},
					},
				})
			end,
			['cssls'] = function()
				lspconfig.cssls.setup({
					on_attach = on_attach_lspsaga,
					settings = {
						css = {
							lint = {
								unknownAtRules = 'ignore',
							},
						},
					},
				})
			end,
		})
	end
end

return setup_mason_lspconfig
