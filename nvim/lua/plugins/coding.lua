return {
	-- Code completion
	{
		"hrsh7th/nvim-cmp", -- S
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			-- snippet plugin
			{
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
			},
			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			return require("configs.nvim-cmp").opts
		end,
		config = function(_, opts)
			require("configs.nvim-cmp").setup(opts)
		end,
	},

	-- Format & Lint
	{
		"stevearc/conform.nvim", -- S
		keys = {
			{
				"=",
				-- "<leader>ft",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = { "n", "v" },
			},
		},
		opts = function()
			return require("configs.conform").opts
		end,
	},

	{
		"kylechui/nvim-surround", -- B
		version = "*",
		event = "VeryLazy",
		opts = {},
	},

	{
		"numToStr/Comment.nvim", -- B
		keys = {
			{ "<leader>cc", mode = "n", desc = "Comment toggle current line" },
			{ "<leader>c", mode = { "n", "o" }, desc = "Comment toggle linewise" },
			{ "<leader>c", mode = "x", desc = "Comment toggle linewise (visual)" },
			{ "<leader>bc", mode = "n", desc = "Comment toggle current block" },
			{ "<leader>b", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
			{ "<leader>b", mode = "x", desc = "Comment toggle blockwise (visual)" },
		},
		opts = {
			padding = true,
			toggler = {
				line = "<leader>cc",
				block = "<leader>bc",
			},
			opleader = {
				line = "<leader>c",
				block = "<leader>b",
			},
		},
	},

	-- Cpp
	{
		"derekwyatt/vim-fswitch", -- B
		ft = { "cpp", "h" },
		cmd = { "FSHere", "FSSplitRight" },
	},
}
