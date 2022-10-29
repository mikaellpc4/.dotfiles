local nnoremap = require('keymap').nnoremap
local inoremap = require('keymap').inoremap

nnoremap('<C-k>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>')
nnoremap('<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>')
nnoremap('K', '<Cmd>Lspsaga hover_doc<CR>')
nnoremap('gd', '<Cmd>Lspsaga lsp_finder<CR>')
inoremap('<C-k>', '<Cmd>Lspsaga signature_help<CR>')
nnoremap('gp', '<Cmd>Lspsaga peek_definition<CR>')
nnoremap('gr', '<Cmd>Lspsaga rename<CR>')
