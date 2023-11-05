
local opts = { silent = true, buffer = 1 }

vim.keymap.set('t', '<Esc>', '<C-C>', opts)
vim.keymap.set('t', '<C-J>', '<C-N>', opts)
vim.keymap.set('t', '<C-K>', '<C-P>', opts)
