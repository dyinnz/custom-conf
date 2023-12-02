return {

	{
		"nvim-treesitter/nvim-treesitter", -- A
		build = ": TSUpdate",
		event = { "VeryLazy" },
		config = function()
			--- @diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				ensure_install = require("ensure-install").treesitter,
				highlight = {
					enable = true,
				},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects", -- A
		event = { "VeryLazy" },
	},

	-- highlight the word under cursor -- TODO: lazy
	{
		"RRethy/vim-illuminate", -- B
		event = { "VeryLazy" },
		config = function()
			require("illuminate").configure({
				providers = { "lsp" },
			})
		end,
	},

	-- highlight TODO
	{
		"folke/todo-comments.nvim", -- B
		event = { "VeryLazy" },
		opts = {},
	},

	-- highlight *.log
	{ "MTDL9/vim-log-highlighting", ft = "log" }, -- A
}
