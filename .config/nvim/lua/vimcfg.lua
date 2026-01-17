-- Global vim config
vim.opt.filetype = "plugin"
vim.opt.secure = true
vim.opt.paste = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.syntax = "on"
-- Number of spaces that a <Tab> in the file counts for
vim.opt.tabstop = 2
-- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.softtabstop = 2
-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 2
-- Expand tab to 2 spaces
vim.opt.expandtab = true
-- Enable 24 bit colors
vim.opt.termguicolors = true

-- Setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "<c-k>", " :wincmd k<CR>")
vim.keymap.set("n", "<c-j>", " :wincmd j<CR>")
vim.keymap.set("n", "<c-h>", " :wincmd h<CR>")
vim.keymap.set("n", "<c-l>", " :wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
