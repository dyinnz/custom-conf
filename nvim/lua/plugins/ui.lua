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
			{
				"rcarriga/nvim-notify", -- OPTIONAL:
				config = function()
					--- @diagnostic disable-next-line: missing-fields
					require("notify").setup({
						timeout = 2000,
						render = "wrapped-compact",
						stages = "fade",
					})
				end,
			},
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

	{
		"stevearc/aerial.nvim", -- B
		lazy = true,
		cmd = { "AerialToggle" },
		keys = { -- Example mapping to toggle outline
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

	{ "nvim-tree/nvim-web-devicons", lazy = true }, -- B
}
