local setup_lsp = function()
	require("mason").setup()
	require("mason-lspconfig").setup()
	require("neodev").setup()

	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	require("lspconfig").bashls.setup({ capabilities = capabilities })
	require("lspconfig").clangd.setup({ capabilities = capabilities })
	require("lspconfig").cmake.setup({ capabilities = capabilities })
	require("lspconfig").lua_ls.setup({ capabilities = capabilities })
	require("lspconfig").pyright.setup({ capabilities = capabilities })
	require("lspconfig").sqlls.setup({ capabilities = capabilities })

	-- Global mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
	-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

	-- Use LspAttach autocommand to only map the following keys
	-- after the language server attaches to the current buffer
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)

			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gk", vim.lsp.buf.signature_help, opts)
			-- TODO: why?
			vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			-- vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		end,
	})
end

return {
	{
		"neovim/nvim-lspconfig", -- S
		dependencies = {
			{ "williamboman/mason.nvim", PATH = "append" },
			{
				"williamboman/mason-lspconfig.nvim",
				opts = {
					ensure_install = require("ensure-install").mason,
				},
			},
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			setup_lsp()
		end,
	},
}
