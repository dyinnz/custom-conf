return {
	-- Fuzzy Finder
	{
		"ibhagwan/fzf-lua", -- S
		cmd = { "FzfLua" },
		keys = require("configs.fzf-lua").keys,
		opts = require("configs.fzf-lua").opts,
	},

	-- Motion
	{
		"aserowy/tmux.nvim", -- B
		event = "VeryLazy",
		-- keys = {
		-- 	{ "C-H", [[<cmd>lua require("tmux").move_left()<cr>]], desc = "move left" },
		-- 	{ "C-J", [[<cmd>lua require("tmux").move_bottom()<cr>]], desc = "move bottom" },
		-- 	{ "C-K", [[<cmd>lua require("tmux").move_top()<cr>]], desc = "move top" },
		-- 	{ "C-L", [[<cmd>lua require("tmux").move_right()<cr>]], desc = "move right" },
		-- },
		opts = {},
	},

	{
		"justinmk/vim-sneak", -- B
		event = "VeryLazy",
		config = function()
      pcall(vim.keymap.del, "", "s")
      pcall(vim.keymap.del, "", "S")
			vim.keymap.set("", "f", "<Plug>Sneak_s")
			vim.keymap.set("", "F", "<Plug>Sneak_S")
		end,
	},

	-- Better diagnostics
	{
		"folke/trouble.nvim", -- C
		event = "VeryLazy",
	},

	-- Better quick fix
	{
		"kevinhwang91/nvim-bqf", -- C
		event = "VeryLazy",
		opts = {
			preview = {
				winblend = 0, -- 0 for opaque window
			},
		},
	},
}
