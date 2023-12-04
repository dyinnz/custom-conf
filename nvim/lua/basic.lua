vim.opt.synmaxcol = 400
vim.opt.lazyredraw = false
vim.opt.scrolloff = 6 -- Minimum lines to keep above and below cursor
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.pumheight = 10 -- Complete popup menu

-- Shell and terminal
vim.opt.shell = "/bin/bash"
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Search
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- Misc
vim.opt.mouse = ""
vim.opt.swapfile = false -- no swap

if vim.fn.has("unix") and not vim.fn.has("macunix") then
	vim.opt.clipboard = "unnamedplus"
end
