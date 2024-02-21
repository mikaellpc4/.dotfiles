local dap = require('dap')
local dapui = require('dapui')

require("nvim-dap-virtual-text").setup()

require('persistent-breakpoints').setup({
  load_breakpoints_event = { "BufReadPost" }
})

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
