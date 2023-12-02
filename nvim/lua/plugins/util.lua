return {

	-- Terminal
	{
		"akinsho/toggleterm.nvim", -- C
		keys = {
			-- { "<F1>", "<cmd>exe 1 . 'ToggleTerm size=24' <CR>",                    mode = { "n", "i", "v", "t" } },
			-- { "<F3>", "<cmd>exe 3 . 'ToggleTerm size=80 direction=vertical' <CR>", mode = { "n", "i", "v", "t" } },
			{ "<F5>", "<cmd>exe 2 . 'ToggleTerm direction=float' <CR>", mode = { "n", "i", "v", "t" } },
		},
		config = function()
			require("toggleterm").setup()
		end,
		-- lazy = false,
	},

	{ "dstein64/vim-startuptime", cmd = "StartupTime" }, -- B
}
