-- Global vim config
vim.cmd("set nocompatible")
vim.cmd("filetype plugin on")
vim.cmd("set secure")
vim.cmd("set paste")
vim.cmd("set number")
vim.cmd("set cursorline")
vim.cmd("syntax on")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")

-- Lazy.nvim

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- Lazy.nvim
require("lazy").setup({

  spec = {
    -- Import plugins
    { import = "plugins" },
  },

  -- Colorscheme that will be used when installing plugins.
  install = { colorscheme = { "tokyonight-night" } },

  -- Automatically check for plugin updates
  checker = {
    enabled = true,
    notify  = false,
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },

})

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
require("nvim-web-devicons").setup()

-- Enable tokyonight
vim.cmd[[colorscheme tokyonight-night]]

-- Pyright
vim.lsp.enable('pyright')

