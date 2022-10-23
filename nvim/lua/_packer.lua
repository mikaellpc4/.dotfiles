-- This file can be loaded by calling `lua require('plugins')` from your init.vim


-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Common Utilities
    use 'nvim-lua/plenary.nvim'

    -- Visuals
    use 'drewtempelmeyer/palenight.vim'
    use 'mhartington/oceanic-next'
    use 'tribela/vim-transparent'

    use 'nvim-lualine/lualine.nvim'

    use 'nvim-tree/nvim-web-devicons'

    use 'nvim-treesitter/nvim-treesitter-context'

    use 'norcalli/nvim-colorizer.lua'

    -- IDE
    
    -- Live Server
    use 'manzeloth/live-server'

    -- Discord
    use 'andweeb/presence.nvim'

    --  Highlight and Indent
    use  'nvim-treesitter/nvim-treesitter'

    use 'jose-elias-alvarez/null-ls.nvim'

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
    }
    
    -- Autocomplete
    use { 
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/nvim-cmp'
    }

    -- Autocomplete Visuals
    use 'onsails/lspkind.nvim'
    use ({
        "glepnir/lspsaga.nvim",
        branch = "main"
    })

    -- Autocomplete Snip
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- AutoTag and AutoPair
    use 'windwp/nvim-ts-autotag'
    use "windwp/nvim-autopairs"

    -- Telescope
    use 'nvim-telescope/telescope.nvim'
        -- Dependence
        use 'BurntSushi/ripgrep'

    -- TABS

    use 'akinsho/bufferline.nvim'

    -- File Navigation

    use 'ThePrimeagen/harpoon'
    use {
        'nvim-tree/nvim-tree.lua',
        tag = 'nightly' -- optional updated every week. (see issue #1193)
    }

    -- GIT

    use 'lewis6991/gitsigns.nvim'
end)
