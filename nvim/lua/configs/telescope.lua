local M = {}

local grep_with_input = function()
	local word = vim.fn.input("Find Word :")
	if word ~= "" then
		local builtin = require("telescope.builtin")
		builtin.grep_string({ search = word })
	end
end

M.keys = {
	{ "<C-P>", "<cmd> Telescope find_files <CR>" },

	{ "<Space>c", "<cmd> Telescope commands <CR>", desc = "fuzzy - commands" },

	{ "<Space>f<Space>", "<cmd> Telescope builtin <CR>", desc = "fuzzy builtin" },
	{ "<Space>fb", "<cmd> Telescope buffers <CR>", desc = "fuzzy buffers" },
	{ "<Space>fc", "<cmd> Telescope command_history <CR>", desc = "fuzzy - grep cword" },
	{ "<Space>ff", "<cmd> Telescope find_files <CR>", desc = "fuzzy buffers" },
	{ "<Space>fk", "<cmd> Telescope keymaps <CR>", desc = "fuzzy - keymaps" },
	{ "<Space>fs", grep_with_input, desc = "fuzzy - grep with input" },
	{ "<Space>fw", "<cmd> Telescope grep_string <CR>", desc = "fuzzy - grep cword" },

	{ "<Space>lc", "<cmd> Telescope lsp_incoming_calls <CR>", desc = "fuzzy - incomming calls" },
	{ "<Space>ld", "<cmd> Telescope diagnostics <CR>", desc = "fuzzy - diagnostics" },
	{ "<Space>li", "<cmd> Telescope lsp_implementations <CR>", desc = "fuzzy - implementations" },
	{ "<Space>lr", "<cmd> Telescope lsp_references <CR>", desc = "fuzzy - references" },
	{ "<Space>ls", "<cmd> Telescope lsp_document_symbols <CR>", desc = "fuzzy - symbols" },
	{ "<Space>ly", "<cmd> Telescope lsp_type_definitions <CR>", desc = "fuzzy - typedefs" },
	{ "gc", "<cmd> Telescope lsp_incoming_calls <CR>", desc = "fuzzy - incomming calls" },
	-- { "gi", "<cmd> FzfLua lsp_implementations <CR>" <CR>", desc = "fuzzy - implementations" },
	-- { "gr", "<cmd> FzfLua lsp_references <CR>" <CR>", desc = "fuzzy - references" },
	{ "gy", "<cmd> Telescope lsp_type_definitions <CR>", desc = "fuzzy - typedefs" },

	{ "<Space>gf", "<cmd> Telescope git_files <CR>", desc = "fuzzy git files" },
	{ "<Space>gl", "<cmd> Telescope git_bcommits <CR>", desc = "fuzzy - git log for buffer" },
	{ "<Space>gs", "<cmd> Telescope git_status <CR>", desc = "fuzzy - git status" },
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
