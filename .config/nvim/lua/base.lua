vim.opt.guicursor = ''

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.g.mapleader = ' '

vim.opt.updatetime = 50

vim.cmd('set splitbelow')

vim.opt.clipboard = 'unnamedplus'

vim.api.nvim_create_user_command('Ex', function()
	vim.cmd(':silent !explorer .')
end, {})

vim.cmd('set shell=zsh')

-- vim.cmd('set')

-- " vim.cmd('set ff=dos')
-- " vim.cmd('set ffs=dos,unix')
-- "
-- " vim.cmd('set shellxquote=')
-- " vim.cmd('let &shellcmdflag = \'-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command \'')
-- " vim.cmd('let &shellquote   = \'\'')
-- " vim.cmd('let &shellpipe    = \'| Out-File -Encoding UTF8 %s\'')
-- " vim.cmd('let &shellredir   = \'| Out-File -Encoding UTF8 %s\'')
