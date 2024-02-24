-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- Themes

  use("drewtempelmeyer/palenight.vim")
  use("folke/tokyonight.nvim")
  use("catppuccin/nvim")

  -- Syntax Hightlight

  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use("nvim-treesitter/playground")

  -- Hexacolor Hightlight

  use("NvChad/nvim-colorizer.lua")

  -- Git Integration

  use("tpope/vim-fugitive")
  use("lewis6991/gitsigns.nvim")

  -- LSP and others things

  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },             -- Required
      { "mfussenegger/nvim-jdtls" },           -- Optional
      { "williamboman/mason.nvim" },           -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },            -- Required
      { "hrsh7th/cmp-nvim-lsp" },        -- Required
      { "hrsh7th/cmp-path" },            -- Optional
      { "L3MON4D3/LuaSnip" },            -- Required

      { "saadparwaiz1/cmp_luasnip" },    -- Optional
      { "rafamadriz/friendly-snippets" } -- Optional
    }
  }

  use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }

  use {
    "creativenull/efmls-configs-nvim",
    tag = "v1.*", -- tag is optional, but recommended
  }

  -- Tmux Integration

  use("christoomey/vim-tmux-navigator")

  -- DEBUG

  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
  use({ "theHamsta/nvim-dap-virtual-text" })
  use({ "jay-babu/mason-nvim-dap.nvim" })
  use({ "Weissle/persistent-breakpoints.nvim" })

  -- Utils

  use("ThePrimeagen/harpoon")

  use("mbbill/undotree")

  use("m4xshen/autoclose.nvim")

  use("numToStr/Comment.nvim")

  use("JoosepAlviste/nvim-ts-context-commentstring")

  use("barrett-ruth/live-server.nvim")

  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.3",
    -- or                            , branch = "0.1.x",
    requires = { { "nvim-lua/plenary.nvim" } }
  }

  use {
    "dhruvasagar/vim-prosession",
    requires = {
      "tpope/vim-obsession",
    },
  }

end)
