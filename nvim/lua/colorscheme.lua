-- Colorscheme
-- vim.opt.background = "dark"
-- vim.cmd.colorscheme("onedark")

require("onedark").setup({
	style = "warmer",
	highlights = {
		["@lsp.type.namespace"] = { fg = "$cyan" },
		["@lsp.type.typeParameter.cpp"] = { fg = "$orange" },
		["cStructure"] = { fg = "$purple" },
		["cppStructure"] = { fg = "$purple" },
	},
})

require("onedark").load()
