vim.opt.synmaxcol = 400
vim.opt.lazyredraw = false
vim.opt.scrolloff = 3 -- Minimum lines to keep above and below cursor
vim.opt.wrap = false
vim.opt.signcolumn = "yes"

-- Complete popup menu
vim.opt.pumheight = 8

-- Shell and terminal
vim.opt.shell = "/bin/bash"
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.mouse = ""

-- no swap
vim.opt.swapfile = false

if (vim.fn.has("unix") and not vim.fn.has("macunix")) then
  vim.opt.clipboard = "unnamedplus"
end
