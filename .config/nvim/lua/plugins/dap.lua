local js_based_languages = {
	"typescript",
	"javascript",
	"javascriptreact",
	"typescriptreact",
	"vue",
}

return {
	-- DEBUG
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"Weissle/persistent-breakpoints.nvim",
			"mxsdev/nvim-dap-vscode-js",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

			local dap_vscode = require("dap.ext.vscode")
			local json = require("plenary.json")
			---@diagnostic disable-next-line: duplicate-set-field
			dap_vscode.json_decode = function(str)
				return vim.json.decode(json.json_strip_comments(str, {}))
			end

			if not dap.adapters["pwa-node"] then
				dap.adapters["pwa-node"] = {
					type = "server",
					host = "localhost",
					port = "${port}",
					executable = {
						command = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug-adapter",
						args = { "${port}" },
					},
				}
			end

			dap_vscode.type_to_filetypes["node"] = js_based_languages

			for _, language in ipairs(js_based_languages) do
				dap.configurations[language] = {
					-- Debug single file
					{
						name = "Launch file",
						type = "pwa-node",
						request = "launch",
						program = "${file}",
						cwd = "${workspaceFolder}",
						sourceMaps = true,
					},
					-- Debug nodejs process (make sure to add --inspect when run the process)
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pickProcess,
						cwd = "${workspaceFolder}",
						sourceMaps = true,
					},
					-- Debug web apps ( client side )
					{
						type = "pwa-chrome",
						request = "launch",
						name = "Launch & Debug Chrome",
						url = function()
							local co = coroutine.running()
							return coroutine.create(function()
								vim.ui.input({
									prompt = "Enter URL: ",
									default = "http://localhost:3000",
								}, function(url)
									if url == nil or url == "" then
										return
									else
										coroutine.resume(co, url)
									end
								end)
							end)
						end,
						webRoot = vim.fn.getcwd(),
						protocol = "inspector",
						sourceMaps = true,
						userDataDir = false,
					},
					{
						name = "----- ↓ launch.json configs ↓ -----",
						type = "",
						request = "launch",
					},
				}
			end

			dapui.setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"Weissle/persistent-breakpoints.nvim",
		config = function()
			require("persistent-breakpoints").setup({
				load_breakpoints_event = { "BufReadPost" },
			})
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup({})
		end,
	},
}
