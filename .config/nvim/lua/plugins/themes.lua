return {
  -- Themes
  { "drewtempelmeyer/palenight.vim" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end
  },
  { "catppuccin/nvim" },
  { 'Mofiqul/dracula.nvim' },
  { 'nvim-tree/nvim-web-devicons' },
}
