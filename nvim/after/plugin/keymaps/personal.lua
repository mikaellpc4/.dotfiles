local Remap = require('keymap')
local nnoremap = Remap.nnoremap

-- Open the current buffer
nnoremap('<leader>pv', '<cmd>:Telescope file_browser path=%:p:h<CR>')

-- Open root
nnoremap('<leader>fb', '<cmd>:Telescope file_browser<CR>')

-- New Tab
nnoremap('<leader>te', '<cmd>:tabedit<CR>')

-- Select All
nnoremap('<leader><C-a>', 'gg<S-v>G')

-- Split Widow
nnoremap('<leader>ss', '<cmd>:split<CR>')
nnoremap('<leader>sv', '<cmd>:vsplit<CR>')

-- Close Widow
nnoremap('<leader>w', '<cmd>:bd<CR>')

-- Move Widow
nnoremap('<leader><tab>', '<C-w>w')
nnoremap('<leader>h', '<C-w>h')
nnoremap('<leader>k', '<C-w>k')
nnoremap('<leader>j', '<C-w>j')
nnoremap('<leader>l', '<C-w>l')

-- Resive Widow
nnoremap('<leader><C-h>', '<C-w><')
nnoremap('<leader><C-l>', '<C-w>>')
nnoremap('<leader><C-k>', '<C-w>+')
nnoremap('<leader><C-j>', '<C-w>-')
