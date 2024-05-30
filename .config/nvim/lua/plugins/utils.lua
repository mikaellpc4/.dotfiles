return {
  -- Utils
  {
    "barrett-ruth/live-server.nvim",
    config = function()
      require('live-server').setup()
    end
  },
  -- TMUX Integration
  { "christoomey/vim-tmux-navigator" },

  -- Kitty integration
  {
    'mikesmithgh/kitty-scrollback.nvim',
    enabled = true,
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
    event = { 'User KittyScrollbackLaunch' },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^4.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      require('kitty-scrollback').setup()
    end,
  },
}
