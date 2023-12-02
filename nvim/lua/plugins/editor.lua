return {
	-- Fuzzy Finder
	{
		"ibhagwan/fzf-lua", -- S
		cmd = { "FzfLua" },
		keys = require("configs.fzf-lua").keys,
		opts = require("configs.fzf-lua").opts,
	},

	-- Motion
	"christoomey/vim-tmux-navigator", -- A -- TODO: nvim version

	"justinmk/vim-sneak", -- B -- TODO: new

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
