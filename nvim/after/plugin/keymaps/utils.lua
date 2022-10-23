local nnoremap = require("keymap").nnoremap
local inoremap = require("keymap").inoremap

-- Close
nnoremap("<C-s>", "<cmd>:w<CR>")
inoremap("<C-s>", "<cmd>:w<CR>")

-- Format text
nnoremap("<leader>lf", ":lua vim.lsp.buf.format()<CR>")
