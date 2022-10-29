vim.opt.guicursor = ''
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.fs.normalize('~/src/neovim')

vim.opt.smartindent = true

vim.opt.wrap = false

vim.g.mapleader = ' '

vim.cmd('set ff=unix')
vim.cmd('set ffs=unix,dos')

vim.cmd('set shell=powershell.exe')
vim.cmd('set shellxquote=')
vim.cmd('let &shellcmdflag = \'-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command \'')
vim.cmd('let &shellquote   = \'\'')
vim.cmd('let &shellpipe    = \'| Out-File -Encoding UTF8 %s\'')
vim.cmd('let &shellredir   = \'| Out-File -Encoding UTF8 %s\'')
