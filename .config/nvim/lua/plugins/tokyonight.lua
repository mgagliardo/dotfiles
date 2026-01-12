return {
  "folke/tokyonight.nvim",
  version = "v4.14.1",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "tokyonight-night"
  end
}

