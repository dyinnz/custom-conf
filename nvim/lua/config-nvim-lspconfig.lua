local M = {}

M.setup = function()
	require("mason").setup({
		PATH = "append",
	})
	require("mason-lspconfig").setup()
	require("neodev").setup()

	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	require("lspconfig").jsonls.setup({
		capabilities = capabilities,
	})
	require("lspconfig").bashls.setup({
		capabilities = capabilities,
	})
	require("lspconfig").lua_ls.setup({
		capabilities = capabilities,
	})
	require("lspconfig").pyright.setup({
		capabilities = capabilities,
	})
	require("lspconfig").clangd.setup({
		capabilities = capabilities,
	})
	require("lspconfig").cmake.setup({
		capabilities = capabilities,
	})
	require("lspconfig").sqlls.setup({
		capabilities = capabilities,
	})
end

return M
