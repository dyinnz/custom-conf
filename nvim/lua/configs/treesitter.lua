local M = {}

M.setup = function()
	--- @diagnostic disable-next-line: missing-fields
	require("nvim-treesitter.configs").setup({
		ensure_install = require("ensure-install").treesitter,

		highlight = {
			enable = true,
		},

		textobjects = {
			select = {
				enable = true,
				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,

				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					-- ["af"] = { query = "@function.outer", desc = "outer of a function" },
					["af"] = { query = "@function.outer" },
					["if"] = { query = "@function.inner" },
					["ac"] = { query = "@class.outer" },
					["ic"] = { query = "@class.inner" },
				},

				selection_modes = {
					["@parameter.outer"] = "v", -- charwise
					["@function.outer"] = "V", -- linewise
					["@class.outer"] = "<c-v>", -- blockwise
				},
			},
			move = {
				enable = true,

				goto_previous_start = {
					["[["] = "@function.inner",
					["[f"] = "@function.inner",
					["[c"] = "@class.outer",
				},
				goto_next_start = {
					["]]"] = "@function.inner",
					["]f"] = "@function.inner",
					["]c"] = "@class.outer",
				},

				goto_previous_end = {
					["[F"] = "@function.inner",
					["[C"] = "@class.outer",
				},
				goto_next_end = {
					["]F"] = "@function.inner",
					["]C"] = "@class.outer",
				},
			},
		},

		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<CR>",
				node_incremental = "<CR>",
				node_decremental = "<BS>",
			},
		},
	})
end

return M
