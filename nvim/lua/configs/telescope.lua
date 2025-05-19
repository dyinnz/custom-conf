local M = {}

local builtin = require("telescope.builtin")

local grep_with_input = function()
	local word = vim.fn.input("Find Word :")
  if word ~= "" then
    builtin.grep_string({ search = word })
  end
end

M.keys = {
	{ "<C-P>", builtin.find_files },

	{ "<Space>c", builtin.commands, desc = "fuzzy - commands" },

	{ "<Space>f<Space>", builtin.builtin, desc = "fuzzy builtin" },
	{ "<Space>fb", builtin.buffers, desc = "fuzzy buffers" },
	{ "<Space>fc", builtin.command_history, desc = "fuzzy - grep cword" },
	{ "<Space>ff", builtin.find_files, desc = "fuzzy buffers" },
	{ "<Space>fk", builtin.keymaps, desc = "fuzzy - keymaps" },
	-- { "<Space>fl", builtin.lines, desc = "fuzzy - lines" },
	{ "<Space>fs", grep_with_input, desc = "fuzzy - grep with input" },
	{ "<Space>fw", builtin.grep_string, desc = "fuzzy - grep cword" },

	{ "<Space>lc", builtin.lsp_incoming_calls, desc = "fuzzy - incomming calls" },
	{ "<Space>ld", builtin.diagnostics, desc = "fuzzy - diagnostics" },
	{ "<Space>li", builtin.lsp_implementations, desc = "fuzzy - implementations" },
	{ "<Space>lr", builtin.lsp_references, desc = "fuzzy - references" },
	{ "<Space>ls", builtin.lsp_document_symbols, desc = "fuzzy - symbols" },
	{ "<Space>ly", builtin.lsp_type_definitions, desc = "fuzzy - typedefs" },
	{ "gc", builtin.lsp_incoming_calls, desc = "fuzzy - incomming calls" },
	-- { "gi", "<cmd> FzfLua lsp_implementations <CR>", desc = "fuzzy - implementations" },
	-- { "gr", "<cmd> FzfLua lsp_references <CR>", desc = "fuzzy - references" },
	{ "gy", builtin.lsp_type_definitions, desc = "fuzzy - typedefs" },

	{ "<Space>gf", builtin.git_files, desc = "fuzzy git files" },
	{ "<Space>gl", builtin.git_bcommits, desc = "fuzzy - git log for buffer" },
	{ "<Space>gs", builtin.git_status, desc = "fuzzy - git status" },
}

M.opts = {
	defaults = {
		scroll_strategy = "limit",
		mappings = {
			i = {
				["<Esc>"] = "close",
			},
		},
		layout_config = {
			horizontal = {
				width = 0.99,
				height = 0.63,
        preview_width = 0.48,
				anchor = "S",
				anchor_padding = 0,
			},
		},
	},
}

return M
