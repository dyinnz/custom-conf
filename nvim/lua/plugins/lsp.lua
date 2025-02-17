local setup_lsp = function()
	require("mason").setup()
	require("mason-lspconfig").setup()
	require("neodev").setup()

	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	require("lspconfig").bashls.setup({ capabilities = capabilities })
	require("lspconfig").clangd.setup({
		capabilities = capabilities,
		cmd = { "clangd", "-j", "6", "-experimental-modules-support" },
	})
	require("lspconfig").cmake.setup({ capabilities = capabilities })
	require("lspconfig").lua_ls.setup({ capabilities = capabilities })
	require("lspconfig").pyright.setup({ capabilities = capabilities })
	require("lspconfig").sqlls.setup({ capabilities = capabilities })
	require("lspconfig").rust_analyzer.setup({ capabilities = capabilities })
	require("lspconfig").ocamllsp.setup({
		capabilities = capabilities,
		on_attach = require("virtualtypes").on_attach,
	})

	-- Global mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "open diagnostic" })
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "prev diagnostic" })
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "next diagnostic" })
	-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

	-- Use LspAttach autocommand to only map the following keys
	-- after the language server attaches to the current buffer
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }

			vim.keymap.set("n", "<space>a", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
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

	-- Function to check if a floating dialog exists and if not
	-- then check for diagnostics under the cursor
	function OpenDiagnosticIfNoFloat()
		for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
			if vim.api.nvim_win_get_config(winid).zindex then
				return
			end
		end
		-- THIS IS FOR BUILTIN LSP
		vim.diagnostic.open_float({}, {
			scope = "cursor",
			focusable = false,
			close_events = {
				"CursorMoved",
				"CursorMovedI",
				"BufHidden",
				"InsertCharPre",
				"WinLeave",
			},
		})
	end

	-- Show diagnostics under the cursor when holding position
	vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
	vim.api.nvim_create_autocmd({ "CursorHold" }, {
		pattern = "*",
		command = "lua OpenDiagnosticIfNoFloat()",
		group = "lsp_diagnostics_hold",
	})
end

return {
	{
		"neovim/nvim-lspconfig", -- S
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					PATH = "append",
				},
			},
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

	{
		"jubnzv/virtual-types.nvim",
		-- ft = { "ocaml" },
	},
}
