local nnoremap = require('keymap').nnoremap

nnoremap('<leader>a', '<cmd>:lua require(\'harpoon.mark\').add_file()<CR>')
-- Not working
nnoremap('<C-e>', '<cmd>:lua require(\'harpoon.ui\').toggle_quick_menu()<CR>')

nnoremap('<leader>1', '<cmd>:lua require(\'harpoon.ui\').nav_file(1)<CR>')
nnoremap('<leader>2', '<cmd>:lua require(\'harpoon.ui\').nav_file(2)<CR>')
nnoremap('<leader>3', '<cmd>:lua require(\'harpoon.ui\').nav_file(3)<CR>')
nnoremap('<leader>4', '<cmd>:lua require(\'harpoon.ui\').nav_file(4)<CR>')

-- nnoremap('<C-e>', '<cmd>:Telescope harpoon marks<CR>')
