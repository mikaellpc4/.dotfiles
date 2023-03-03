-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
	-- Packer can manage itself
	use('wbthomason/packer.nvim')

	-- Common Utilities
	use('nvim-lua/plenary.nvim')

	-- Tmux and window navigation
	use('christoomey/vim-tmux-navigator')
	use('szw/vim-maximizer')

	-- Visuals
	use('drewtempelmeyer/palenight.vim')
	use('mhartington/oceanic-next')
	use('tribela/vim-transparent')

	use('nvim-lualine/lualine.nvim')

	use('nvim-tree/nvim-web-devicons')

	use('DaikyXendo/nvim-material-icon')

	use('nvim-treesitter/nvim-treesitter-context')

	use('norcalli/nvim-colorizer.lua')

	-- IDE

	-- Live Server
	use('manzeloth/live-server')

	--  Highlight and Indent
	use('nvim-treesitter/nvim-treesitter')

	use('jose-elias-alvarez/null-ls.nvim')

	-- LSP
	use({
		'williamboman/mason.nvim',
		'jay-babu/mason-null-ls.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig',
		'ray-x/lsp_signature.nvim',
	})

	-- Java LSP

	-- use("use mfussenegger/nvim-jdtls")

	-- Autocomplete
	use({
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'yioneko/nvim-cmp',
		'pedro757/emmet',
	})

	-- Autocomplete Visuals
	use('onsails/lspkind.nvim')

	-- Lspsaga
	use({
		'glepnir/lspsaga.nvim',
		branch = 'main',
	})

	-- Autocomplete Snip
	use('L3MON4D3/LuaSnip')
	use('saadparwaiz1/cmp_luasnip')
	use('rafamadriz/friendly-snippets')

	-- AutoTag and AutoPair
	use('windwp/nvim-ts-autotag')
	use('windwp/nvim-autopairs')

	-- Telescope
	use('nvim-telescope/telescope.nvim')
	-- Dependence
	use('BurntSushi/ripgrep')

	-- TABS

	use('akinsho/bufferline.nvim')

	-- File Navigation

	-- use('mikaellpc4/harpoon')
	use('ThePrimeagen/harpoon')

	use('nvim-telescope/telescope-file-browser.nvim')

	-- Nvim view media
	use('nvim-lua/popup.nvim')
	use('nvim-telescope/telescope-media-files.nvim')

	-- GIT

	use('lewis6991/gitsigns.nvim')
	use('tpope/vim-fugitive')

	-- Terminal

	use('akinsho/toggleterm.nvim')

	-- Useful

	use('numToStr/Comment.nvim')
	use('JoosepAlviste/nvim-ts-context-commentstring')

	-- DAP

	use({
		'mfussenegger/nvim-dap',
		opt = true,
		module = { 'dap' },
		requires = {
			'theHamsta/nvim-dap-virtual-text',
			'rcarriga/nvim-dap-ui',
			'mfussenegger/nvim-dap-python',
			'nvim-telescope/telescope-dap.nvim',
			{ 'leoluz/nvim-dap-go', module = 'dap-go' },
			{ 'jbyuki/one-small-step-for-vimkind', module = 'osv' },
			{ 'mxsdev/nvim-dap-vscode-js' },
			{
				'microsoft/vscode-js-debug',
				opt = true,
				run = 'npm install --legacy-peer-deps && npm run compile',
			},
		},
		config = function()
			require('config.dap').setup()
		end,
		disable = false,
	})
end)
