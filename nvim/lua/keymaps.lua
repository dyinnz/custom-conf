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
-- map
vim.keymap.set("", "q", "<nop>")

vim.keymap.set("n", "<C-A>", "^")
vim.keymap.set("i", "<C-A>", "<ESC>I")
vim.keymap.set("c", "<C-A>", "<Home>")
vim.keymap.set("n", "<C-E>", "$")
vim.keymap.set("i", "<C-E>", "<ESC>A")
vim.keymap.set("c", "<C-E>", "<End>")
vim.keymap.set("c", "<C-B>", "<Left>")
vim.keymap.set("c", "<C-F>", "<Right>")

--------------------------------------------------------------------------------
-- visual mode

-- continuous shift
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

--------------------------------------------------------------------------------
-- normal mode

vim.keymap.set("n", "<Tab>", "gt")
vim.keymap.set("n", "<S-Tab>", "gT")

-- Search mappings: These will make it so that going to the next one in a
-- search will center on the line it's found in.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "XX", '"+cc<CR>')
vim.keymap.set("n", "Xx", '"+cc<CR>')
vim.keymap.set("n", "YY", '"+yy<CR>')
vim.keymap.set("n", "Yy", '"+yy<CR>')
vim.keymap.set("n", "<leader>p", '"+gp<CR>')

-- Space

vim.keymap.set("n", "<space>q", "<cmd>q<CR>")
vim.keymap.set("n", "<space>Q", "<cmd>q!<CR>")

-- Window
vim.keymap.set("n", "<Space>=", "<cmd>vertical resize +10<CR>")
vim.keymap.set("n", "<Space>-", "<cmd>vertical resize -10<CR>")

vim.keymap.set("n", "<Space>wc", "<cmd>close<CR>")
vim.keymap.set("n", "<Space>wo", "<cmd>only<CR>")
vim.keymap.set("n", "<Space>ws", "<cmd>sp<CR>")
vim.keymap.set("n", "<Space>wv", "<cmd>vs<CR>")

-- Tab
vim.keymap.set("n", "<Space>tc", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<Space>tn", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<Space>to", "<cmd>tabonly<CR>")
vim.keymap.set("n", "<Space>tp", "<cmd>tabprev<CR>")
vim.keymap.set("n", "<Space>tt", "<cmd>tab split<CR>")

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
vim.keymap.set("n", "<Space>bd", "<cmd>bd<CR>")
vim.keymap.set("n", "<Space>bn", "<cmd>bn<CR>")
vim.keymap.set("n", "<Space>bp", "<cmd>bp<CR>")
vim.keymap.set("n", "<Space>bw", "<cmd>w<CR>")

vim.keymap.set("n", "<Space>in", "<cmd>Inspect<CR>")

--- TODO: move to other
vim.keymap.set("n", "<Space>gh", "<cmd>DiffviewFileHistory<CR>")
vim.keymap.set("n", "<Space>gd", "<cmd>DiffviewOpen<CR>")
vim.keymap.set("n", "<Space>gc", "<cmd>DiffviewClose<CR>")
vim.keymap.set("n", "<Space>gb", function()
	vim.cmd("Gitsigns toggle_current_line_blame")
	vim.cmd("set nonumber!")
end, { desc = "toggle number line" })

-- begin with <leader>
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<C-S>", "<cmd>w<CR>")

--------------------------------------------------------------------------------
-- terminal mode

vim.cmd([[
autocmd TermOpen,TermEnter * startinsert
autocmd BufEnter,BufNew term://* startinsert
]])

vim.keymap.set("t", "<C-Q>", "<C-Bslash><C-N>")
vim.keymap.set("t", "<C-H>", "<C-Bslash><C-N><C-W>h")
vim.keymap.set("t", "<C-J>", "<C-Bslash><C-N><C-W>j")
vim.keymap.set("t", "<C-K>", "<C-Bslash><C-N><C-W>k")
vim.keymap.set("t", "<C-L>", "<C-Bslash><C-N><C-W>l")

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.opt_local.cursorline = true
	vim.keymap.set("n", "q", "<cmd>startinsert<cr>", opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

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
		},
	},
})
