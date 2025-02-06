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
		opts = {
			copy_sync = {
				sync_unnamed = false, -- sync_unnamed will break block paste
			},
		},
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
		"folke/trouble.nvim", -- S
		event = "VeryLazy",
		keys = {
			{ "<space>xx", "<cmd> Trouble diagnostics toggle <cr>", desc = "Trouble Diagnostics" },
			{ "<space>xb", "<cmd> Trouble diagnostics toggle filter.buf=0 <cr>", desc = "Trouble Buffer Diagnostics" },
			{ "gd", "<cmd> Trouble lsp_definitions<cr>", desc = "trouble lsp_definitions" },
			{ "gi", "<cmd> Trouble lsp_implementations<cr>", desc = "trouble lsp_implementations" },
			{ "gr", "<cmd> Trouble lsp_references <cr>", desc = "trouble lsp_references" },
			{ "gy", "<cmd> Trouble lsp_type_definitions<cr>", desc = "trouble lsp_typedefs" },
		},
		opts = {
			cycle_results = false,
			height = 12,
		},
	},

	-- Symbol outline
	{
		"stevearc/aerial.nvim", -- B
		lazy = true,
		cmd = { "AerialToggle" },
		keys = {
			{ "<space>o", "<cmd>AerialToggle! left<CR>", desc = "Toggle outline" },
		},
		opts = {
			backends = { "lsp", "markdown", "man" },
			filter_kind = {
				-- "Namespace",
				"Class",
				"Constructor",
				"Enum",
				"Function",
				"Interface",
				"Module",
				"Method",
				"Struct",
			},
		},
	},
}
