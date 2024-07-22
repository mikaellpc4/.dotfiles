vim.g.mapleader = " "

local nmap = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = desc })
end

local vmap = function(keys, func, desc)
	vim.keymap.set("v", keys, func, { desc = desc })
end

local map = function(keys, func, desc)
	vim.keymap.set({ "n", "v" }, keys, func, { desc = desc })
end

nmap("-", "<cmd>Oil<CR>", "Open Oil")
nmap("<leader>-", require("oil").toggle_float, "Open Oil floating on parent")

vmap("J", ":m '>+1<CR>gv=gv", "Move selected lines down")
vmap("K", ":m '<-2<CR>gv=gv", "Move selected lines up")

nmap("J", "mzJ`z", "Join line below")
-- nmap("<C-d>", "<C-d>zz")
-- nmap("<C-u>", "<C-u>zz")
nmap("n", "nzzzv", "Move to next search result and center")
nmap("N", "Nzzzv", "Move to previous search result and center")

map("<leader>p", [["_dP]], "[P]aste over current selection")

map("<leader>y", [["+y]], "[Y]ank to system clipboard")
nmap("<leader>Y", [["+Y]], "[Y]ank entire line to system clipboard")

map("<leader>d", [["_d]], "[D]elete current line or selection")

nmap("Q", "<nop>", "Disable [Q]uick window key")
-- nmap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- nmap("<C-k>", "<cmd>cnext<CR>zz")
-- nmap("<C-j>", "<cmd>cprev<CR>zz")
-- nmap("<leader>k", "<cmd>lnext<CR>zz")
-- nmap("<leader>j", "<cmd>lprev<CR>zz")

nmap("<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
nmap("<leader>x", "<cmd>!chmod +x %<CR>", "[C]hmod current file to executable")
nmap("<leader>X", "<cmd>!chmod -x %<CR>", "[C]hmod current file to not executable")

-- Telescope
local builtin = require("telescope.builtin")
nmap("<leader>sh", builtin.help_tags, "[S]earch [H]elp")
nmap("<leader>sk", builtin.keymaps, "[S]earch [K]eymaps")
nmap("<leader>sf", builtin.find_files, "[S]earch [F]iles")
nmap("<leader>ss", builtin.builtin, "[S]earch [S]elect Telescope")
nmap("<leader>sw", builtin.grep_string, "[S]earch current [W]ord")
nmap("<leader>sg", builtin.live_grep, "[S]earch by [G]rep")
nmap("<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics")
nmap("<leader>sR", builtin.resume, "[S]earch [R]esume")
nmap("<leader>s.", builtin.oldfiles, "[S]earch Recent Files ('.' for repeat)")
nmap("<leader><leader>", builtin.buffers, "[ ] Find existing buffers")

-- Slightly advanced example of overriding default behavior and theme
nmap("<leader>/", function()
	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, "[/] Fuzzily search in current buffer")

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
nmap("<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, "[S]earch [/] in Open Files")

nmap("<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, "[S]earch [N]eovim files")

-- Debug dap & dapui
local dap = require("dap")
local dapui = require("dapui")
local persistentbreakpoint = require("persistent-breakpoints.api")

nmap("<leader>dt", dapui.toggle, "[D]ebug [T]oggle UI")
nmap("<leader>db", persistentbreakpoint.toggle_breakpoint, "[D]ebug [B]reakpoint")
nmap("<leader>dc", dap.continue, "[D]ebug [C]ontinue")
nmap("<leader>dr", function()
	dapui.open({ reset = true })
end, "[D]ebug [R]eset and open UI")
nmap("<C-s>", dap.step_into, "Step [I]nto in debug mode")

-- Conform
local conform = require("conform")

map("<leader>f", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, "[F]ormat file or range (in visual mode)")

-- Fugitive
nmap("gs", "<cmd>G<CR>", "[G]it [S]tatus")
nmap("ga", "<cmd>diffget //2<CR>", "[G]et diff from left side")
nmap("gl", "<cmd>diffget //3<CR>", "[G]et diff from right side")

-- Nvim lint
local lint = require("lint")

nmap("<leader>l", lint.try_lint, "[L]inting for current file")

-- Undotree
nmap("<leader>u", vim.cmd.UndotreeToggle, "[U]ndo tree toggle")

-- LSP

nmap("]d", vim.diagnostic.goto_next, "Goto Next [D]iagnostics")
nmap("[d", vim.diagnostic.goto_prev, "Goto Prev [D]iagnostics")
