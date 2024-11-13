local M = {}

M.opts = {
	lsp_fallback = true,
	log_level = vim.log.levels.DEBUG,
	formatters_by_ft = {
		cpp = { "clang_format" },
		lua = { "stylua" },
		python = { "ruff", "ruff_format" },
		sh = { "beautysh" },
		-- sql = { "sqlfmt" },
		-- ocaml = { "ocamlformat" },
		rust = { "rustfmt" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		vue = { "prettierd" },
		css = { "prettierd" },
		html = { "prettierd" },
	},
}

return M
