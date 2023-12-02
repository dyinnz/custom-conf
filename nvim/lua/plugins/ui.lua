return {
	{
		"navarasu/onedark.nvim", -- S
		priority = 1000,
		config = function()
			require("colorscheme")
		end,
	},

	{
		"nvim-lualine/lualine.nvim", -- S
    event = "VeryLazy",
		opts = function()
			return require("configs.lualine").opts
		end,
	},

	-- rewrite ui
	{
		"folke/noice.nvim", -- A
		event = "VeryLazy",
		opts = function()
			return require("configs.noice").opts
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify", -- OPTIONAL:
		},
	},

	-- show keymap
	{
		"folke/which-key.nvim", -- A
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {},
	},

	{ "nvim-tree/nvim-web-devicons", lazy = true }, -- B
}
