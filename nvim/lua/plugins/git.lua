return {
	{
		"lewis6991/gitsigns.nvim", -- A
		ft = { "gitcommit", "diff" },
		init = function()
			require("configs.gitsigns").init()
		end,
		opts = function()
			return require("configs.gitsigns").opts
		end,
	},

	{
		"sindrets/diffview.nvim",
		keys = {
			{
				"<space>gh",
				"<cmd>DiffviewFileHistory<CR>",
				desc = "DiffviewFileHistory",
			},
			{
				"<space>gd",
				"<cmd>DiffviewOpen<CR>",
				desc = "DiffviewOpen",
			},
			{
				"<space>gc",
				"<cmd>DiffviewClose<CR>",
				desc = "DiffviewClose",
			},
		},
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
	}, -- C

	{ "tpope/vim-fugitive", event = "VeryLazy" }, -- C -- TODO: lazy cmd
}
