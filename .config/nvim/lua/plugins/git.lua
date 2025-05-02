return {
  -- Git Integration
  { "tpope/vim-fugitive" },
  {
    "FabijanZulj/blame.nvim",
    config = function()
      require("blame").setup()
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  },
}
