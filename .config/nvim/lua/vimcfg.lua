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

-- Ensure newline at the end of all files
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  group = vim.api.nvim_create_augroup('UserOnSave', {}),
  pattern = '*',
  callback = function()
    local n_lines = vim.api.nvim_buf_line_count(0)
    local last_nonblank = vim.fn.prevnonblank(n_lines)
    if last_nonblank <= n_lines then vim.api.nvim_buf_set_lines(0,
      last_nonblank, n_lines, true, { '' })
    end
  end,
})
