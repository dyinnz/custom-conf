-- Colorscheme
-- vim.opt.background = "dark"
-- vim.cmd.colorscheme("onedark")

require("onedark").setup({
	style = "warmer",
	highlights = {
    -- cpp
		["@lsp.type.namespace"] = { fg = "$cyan" },
		["@lsp.type.typeParameter.cpp"] = { fg = "$orange" },
		["cStructure"] = { fg = "$purple" },
		["cppStructure"] = { fg = "$purple" },
    -- cmake
    ["@variable.cmake"] = { fg = "$red"},
	},
})

require("onedark").load()


