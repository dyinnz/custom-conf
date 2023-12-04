--------------------------------------------------------------------------------
-- command abbr
-- no one is really happy until you have this shortcuts
-- vim.keymap.set('ca', 'Q!', 'q!')
-- vim.keymap.set('ca', 'Q', 'q')
-- vim.keymap.set('ca', 'Qall!', 'qall!')
-- vim.keymap.set('ca', 'Qall', 'qall')
-- vim.keymap.set('ca', 'W!', 'w!')
-- vim.keymap.set('ca', 'W', 'w')
-- vim.keymap.set('ca', 'WQ', 'wq')
-- vim.keymap.set('ca', 'Wa', 'wa')
-- vim.keymap.set('ca', 'Wq', 'wq')
-- vim.keymap.set('ca', 'wQ', 'wq')

vim.cmd("cnoreabbrev W! w!")
vim.cmd("cnoreabbrev Q! q!")
vim.cmd("cnoreabbrev Qall! qall!")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev Wa wa")
vim.cmd("cnoreabbrev wQ wq")
vim.cmd("cnoreabbrev WQ wq")
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Qall qall")

vim.cmd("cnoreabbrev Nohl nohl")
vim.cmd("cnoreabbrev NOhl nohl")
vim.cmd("cnoreabbrev NOHl nohl")
vim.cmd("cnoreabbrev NOHL nohl")

--------------------------------------------------------------------------------

vim.keymap.set("", "q", "<nop>") -- disable maCRo

-- Moving
vim.keymap.set("i", "<C-A>", "<ESC>I")
vim.keymap.set("c", "<C-A>", "<Home>")
vim.keymap.set("i", "<C-E>", "<ESC>A")
-- vim.keymap.set("c", "<C-E>", "<End>") -- default
vim.keymap.set({ "c", "i" }, "<C-B>", "<Left>")
vim.keymap.set({ "c", "i" }, "<C-F>", "<Right>")

-- Search mappings:
-- These will make it so that going to the next one in a search will
-- center on the line it's found in.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Editing
-- continuous shift
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- ∆ ATL-J; ˚ ATL-K
vim.keymap.set("n", "∆", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "˚", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "∆", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "˚", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "∆", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "˚", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Yank
vim.keymap.set("n", "XX", '"+cc')
vim.keymap.set("n", "Xx", '"+cc')
vim.keymap.set("n", "YY", '"+yy')
vim.keymap.set("n", "Yy", '"+yy')
vim.keymap.set("n", "<leader>p", '"+gp<CR>', { desc = "paste from system yank" })

-- Window
vim.keymap.set("n", "<space>q", "<cmd>quit<CR>")
vim.keymap.set("n", "<space>Q", "<cmd>quit!<CR>")

vim.keymap.set("n", "<Space>=", "<cmd>vertical resize +10<CR>")
vim.keymap.set("n", "<Space>-", "<cmd>vertical resize -10<CR>")

vim.keymap.set("n", "<Space>wc", "<cmd>close<CR>")
vim.keymap.set("n", "<Space>wo", "<cmd>only<CR>")
vim.keymap.set("n", "<Space>ws", "<cmd>sp<CR>")
vim.keymap.set("n", "<Space>wv", "<cmd>vs<CR>")

-- Tab
vim.keymap.set("n", "<Tab>", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>tabprev<CR>")

vim.keymap.set("n", "<Space>tc", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<Space>tn", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<Space>to", "<cmd>tabonly<CR>")
vim.keymap.set("n", "<Space>tp", "<cmd>tabprev<CR>")
vim.keymap.set("n", "<Space>tt", "<cmd>tab split<CR>")
vim.keymap.set("n", "<Space>TT", "<cmd>tabnew<CR>")

vim.keymap.set("n", "<Space>1", "1gt<CR>", { desc = "tab 1" })
vim.keymap.set("n", "<Space>2", "2gt<CR>", { desc = "tab 2" })
vim.keymap.set("n", "<Space>3", "3gt<CR>", { desc = "tab 3" })
vim.keymap.set("n", "<Space>4", "4gt<CR>", { desc = "tab 4" })
vim.keymap.set("n", "<Space>5", "5gt<CR>", { desc = "tab 5" })
vim.keymap.set("n", "<Space>6", "6gt<CR>", { desc = "tab 6" })
vim.keymap.set("n", "<Space>7", "7gt<CR>", { desc = "tab 7" })
vim.keymap.set("n", "<Space>8", "8gt<CR>", { desc = "tab 8" })
vim.keymap.set("n", "<Space>9", "9gt<CR>", { desc = "tab 9" })

--Buffer
vim.keymap.set("n", "<Space>bd", "<cmd>bdelte<CR>")
vim.keymap.set("n", "<Space>bn", "<cmd>bnext<CR>")
vim.keymap.set("n", "<Space>bp", "<cmd>bprev<CR>")
vim.keymap.set("n", "[b", "<cmd>bprev<CR>")
vim.keymap.set("n", "]b", "<cmd>bnext<CR>")
vim.keymap.set("n", "<Space>bw", "<cmd>write<CR>")
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>write<CR><esc>", { desc = "Save file" })
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>")

-- Misc
vim.keymap.set("n", "<Space>in", "<cmd>Inspect<CR>")

vim.keymap.set("n", "<Space>fe", "?error:<CR>")
-- vim.keymap.set("t", "<Space>fe", "<C-Bslash><C-N>?error:<CR>")

vim.keymap.set("n", "<leader>ds", [[<cmd> %s/\s\+$//e <cr>]], { desc = "trim whiltespace" })

--------------------------------------------------------------------------------
-- terminal mode

vim.keymap.set("t", "jk", "<C-Bslash><C-n>")
vim.keymap.set("t", "<C-H>", "<C-Bslash><C-N><C-W>h")
vim.keymap.set("t", "<C-J>", "<C-Bslash><C-N><C-W>j")
vim.keymap.set("t", "<C-K>", "<C-Bslash><C-N><C-W>k")
vim.keymap.set("t", "<C-L>", "<C-Bslash><C-N><C-W>l")

vim.cmd([[
autocmd TermOpen,TermEnter * startinsert
autocmd BufEnter,BufNew term://* startinsert
]])

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.opt_local.cursorline = true
	vim.keymap.set("n", "q", "<cmd>startinsert<CR>", opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

--------------------------------------------------------------------------------
--- which key

function _G.register_which_key()
	local wk = require("which-key")
	wk.register({
		["<space>"] = {
			name = "leader",
			{
				q = "which_key_ignore",
				Q = "which_key_ignore",

				b = { name = "buffer" },
				f = { name = "fzf" },
				g = { name = "git" },
				i = { name = "inspect" },
				l = { name = "lsp" },
				t = { name = "tab" },
				w = { name = "window" },
			},
		},
	})
end
