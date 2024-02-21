require("mikaellpc.remap")
require("mikaellpc.packer")

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.wo.wrap = false
vim.g.mapleader = " "

vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#c53e3e', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

vim.fn.sign_define('DapBreakpoint', {
  text = '',
  texthl = 'DapBreakpoint',
  linehl = 'DapBreakpoint',
  numhl =
  'DapBreakpoint'
})
vim.fn.sign_define('DapBreakpointCondition',
  { text = 'ﳁ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected',
  { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

-- Define Lua function for directory removal
function s_rmdir()
    local ft = vim.bo.filetype
    local b

    if ft == 'dirvish' then
        b = vim.fn.getline('.')
    else
        b = vim.fn.fnamemodify(vim.fn.bufname(''), ':p') .. vim.fn.getline('.')
    end

    local confirm = vim.fn.input('delete ' .. b .. ' ? (y/n) ')
    if confirm == 'y' then
        local success, error_code = pcall(vim.fn.delete, b, 'rf')
        if not success then
            print('Error deleting directory: ' .. b)
            print('Error code: ' .. error_code)
        end
    end
end

-- Define command to call the Lua function
vim.cmd('command! Rmnetrw call v:lua.s_rmdir()')
