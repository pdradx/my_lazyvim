-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Snacks animations
-- Set to `false` to globally disable all snacks animations
vim.g.snacks_animate = false
vim.g.autoformat = false

local opt = vim.opt
opt.shiftwidth = 4

-- opt.timeoutlen = 1000
-- opt.ttimeoutlen = 0

vim.filetype.add({
  extension = {
    tpp = "cpp",
  },
})

vim.o.fileencodings = vim.o.fileencodings .. ",gb2312"

-- vim.g.root_spec = { "cwd" }
