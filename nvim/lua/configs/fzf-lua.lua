local M = {}

local fzf_files = function()
	local exclude = require("common").project_config.exclude
	local fd_opts = require("fzf-lua.defaults").defaults.files.fd_opts
	for _, pattern in ipairs(exclude) do
		fd_opts = fd_opts .. " --exclude " .. pattern
	end
	require("fzf-lua").files({ fd_opts = fd_opts })
end

local fzf_blines = function()
	require("fzf-lua").blines({ fzf_opts = { ["--layout"] = "reverse" } })
end

M.keys = {
	-- { "<C-P>", "<cmd> FzfLua files <CR>" },
	{ "<C-P>", fzf_files },

	{ "<Space>c", "<cmd> FzfLua commands <CR>", desc = "fuzzy - commands" },

	{ "<Space>f<Space>", "<cmd> FzfLua builtin <CR>", desc = "fuzzy builtin" },
	{ "<Space>fb", "<cmd> FzfLua buffers <CR>", desc = "fuzzy buffers" },
	{ "<Space>fc", "<cmd> FzfLua command_history <CR>", desc = "fuzzy - grep cword" },
	{ "<Space>ff", "<cmd> FzfLua files <CR>", desc = "fuzzy buffers" },
	{ "<Space>fk", "<cmd> FzfLua keymaps <CR>", desc = "fuzzy - keymaps" },
	{ "<Space>fl", fzf_blines, desc = "fuzzy - lines" },
	{ "<Space>fs", "<cmd> FzfLua grep <CR>", desc = "fuzzy - grep" },
	{ "<Space>fw", "<cmd> FzfLua grep_cword <CR>", desc = "fuzzy - grep cword" },

	{ "<Space>lc", "<cmd> FzfLua lsp_incoming_calls <CR>", desc = "fuzzy - incomming calls" },
	{ "<Space>ld", "<cmd> FzfLua lsp_document_diagnostics <CR>", desc = "fuzzy - diagnostics" },
	{ "<Space>li", "<cmd> FzfLua lsp_implementations <CR>", desc = "fuzzy - implementations" },
	{ "<Space>lr", "<cmd> FzfLua lsp_references <CR>", desc = "fuzzy - references" },
	{ "<Space>ls", "<cmd> FzfLua lsp_document_symbols <CR>", desc = "fuzzy - symbols" },
	{ "<Space>ly", "<cmd> FzfLua lsp_typedefs <CR>", desc = "fuzzy - typedefs" },
	{ "gc", "<cmd> FzfLua lsp_incoming_calls <CR>", desc = "fuzzy - incomming calls" },
	-- { "gi", "<cmd> FzfLua lsp_implementations <CR>", desc = "fuzzy - implementations" },
	-- { "gr", "<cmd> FzfLua lsp_references <CR>", desc = "fuzzy - references" },
	{ "gy", "<cmd> FzfLua lsp_typedefs <CR>", desc = "fuzzy - typedefs" },

	{ "<Space>gf", "<cmd> FzfLua git_files <CR>", desc = "fuzzy git files" },
	{ "<Space>gl", "<cmd> FzfLua git_bcommits <CR>", desc = "fuzzy - git log for buffer" },
	{ "<Space>gs", "<cmd> FzfLua git_status <CR>", desc = "fuzzy - git status" },
}

M.opts = {
	fzf_opts = { ["--layout"] = "default" },
	winopts = { width = 1.0, height = 0.62, row = 1.0, preview = { horizontal = "right:50%" } },
}

return M
