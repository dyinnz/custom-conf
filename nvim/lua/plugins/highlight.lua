return {

	{
		"nvim-treesitter/nvim-treesitter", -- A
		build = ": TSUpdate",
		event = "VeryLazy",
		config = function()
			require("configs.treesitter").setup()
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects", -- A
		event = "VeryLazy",
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		ft = { "cpp", "lua", "python" },
		event = "VeryLazy",
		-- config = function()
		-- end,
	},

	-- highlight the word under cursor
	{
		"RRethy/vim-illuminate", -- B
		event = "VeryLazy",
		config = function()
			require("illuminate").configure({
				providers = { "lsp", "treesitter" },
			})
		end,
	},

	-- highlight TODO
	{
		"folke/todo-comments.nvim", -- B
		event = "VeryLazy",
		opts = {},
	},

	-- highlight *.log
	{ "MTDL9/vim-log-highlighting", ft = "log" }, -- A
}
