return {
  -- DEBUG
  {
    "Weissle/persistent-breakpoints.nvim",
    config = function()
      require('persistent-breakpoints').setup({
        load_breakpoints_event = { "BufReadPost" }
      })
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup({})
    end
  },
  { "jay-babu/mason-nvim-dap.nvim" },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "Weissle/persistent-breakpoints.nvim" },
    config = function()

      local dap = require('dap')
      local dapui = require('dapui')

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

      local persistentbreakpoint = require('persistent-breakpoints.api')

      vim.keymap.set('n', '<leader>dt', function()
        dapui.toggle()
      end)

      vim.keymap.set('n', '<leader>db', function()
        persistentbreakpoint.toggle_breakpoint()
      end)

      vim.keymap.set('n', '<leader>dc', function()
        dap.continue()
      end)

      vim.keymap.set('n', '<leader>dr', function()
        dapui.open({ reset = true })
      end)

      vim.keymap.set('n', '<C-s>', function()
        dap.step_into()
      end)
    end
  }
}
