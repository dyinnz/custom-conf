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
				"<cmd>DiffviewToggle<CR>",
				desc = "DiffviewToggle",
			},
			{
				"<space>gc",
				"<cmd>DiffviewClose<CR>",
				desc = "DiffviewClose",
			},
		},
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },

		config = function()
			vim.api.nvim_create_user_command("DiffviewToggle", function(e)
				local view = require("diffview.lib").get_current_view()

				if view then
					vim.cmd("DiffviewClose")
				else
					vim.cmd("DiffviewOpen " .. e.args)
				end
			end, { nargs = "*" })
		end,
	}, -- C

	{ "tpope/vim-fugitive", event = "VeryLazy" }, -- C -- TODO: lazy cmd
}
