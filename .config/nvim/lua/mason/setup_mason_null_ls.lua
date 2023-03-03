vim.api.nvim_create_autocmd('BufWritePre', {
	command = 'silent! lua vim.lsp.buf.format({ buffr = buffr })',
	group = vim.api.nvim_create_augroup('MyAutocmdsFormatting', {}),
})

local setup_mason_null_ls = function()
	local null_ls_ok, null_ls = pcall(require, 'null-ls')
	local mason_null_ls_ok, mason_null_ls = pcall(require, 'mason-null-ls')

	if null_ls_ok and mason_null_ls_ok then
		mason_null_ls.setup({
			ensure_installed = {
				'eslint_d',
				'stylua',
				'prettierd',
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_null_ls.setup_handlers({
			stylua = function()
				null_ls.register(null_ls.builtins.formatting.stylua.with({
					extra_args = { '--quote-style', 'ForceSingle' },
				}))
			end,
			prettierd = function()
				null_ls.register(null_ls.builtins.formatting.prettierd)
				null_ls.register(null_ls.builtins.formatting.prettierd.with({
					condition = function(utils)
						local hasEslint = utils.root_has_file({ '.eslintrc.js', '.eslintrc.json' })
						return not hasEslint
					end,
				}))
			end,
			eslint_d = function()
				null_ls.register(null_ls.builtins.diagnostics.eslint_d.with({
					condition = function(utils)
						local hasEslint = utils.root_has_file({ '.eslintrc.js', '.eslintrc.json' })
						return hasEslint
					end,
				}))
				null_ls.register(null_ls.builtins.formatting.eslint_d.with({
					condition = function(utils)
						local hasEslint = utils.root_has_file({ '.eslintrc.js', '.eslintrc.json' })
						return hasEslint
					end,
				}))
			end,
		})

		null_ls.setup({})
	end
end

return setup_mason_null_ls
