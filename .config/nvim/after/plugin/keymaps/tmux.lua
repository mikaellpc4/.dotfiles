local nnoremap = require('keymap').nnoremap

nnoremap('C-h', '<C-U>TmuxNavigateLeft<cr>')
nnoremap('C-l', '<C-U>TmuxNavigateRight<cr>')
nnoremap('C-k', '<C-U>TmuxNavigateUp<cr>')
nnoremap('C-j', '<C-U>TmuxNavigateDown<cr>')

-- nnoremap("M-h", "<C-U>TmuxNavigateLeft<cr>");
-- nnoremap("M-l", "<C-U>TmuxNavigateRight<cr>");
-- nnoremap("M-k", "<C-U>TmuxNavigateUp<cr>");
-- nnoremap("M-j", "<C-U>TmuxNavigateDown<cr>");
