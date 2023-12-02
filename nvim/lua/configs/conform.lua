local M = {}

M.opts = {
	lsp_fallback = true,
	log_level = vim.log.levels.DEBUG,
	formatters_by_ft = {
		cpp = { "clang_format" },
		lua = { "stylua" },
		python = { "isort", "black" },
		sh = { "beautysh" },
		sql = { "sqlfmt" },
	},
}

return M
