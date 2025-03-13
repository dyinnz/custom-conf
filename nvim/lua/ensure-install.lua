local M = {}

M.treesitter = {
  -- native
	"cmake",
	"c",
	"cpp",
	"rust",
  -- jvm
	"java",
	"scala",
  -- script
	"bash",
	"python",
	"sql",
  -- vim
	"lua",
	"vim",
	"vimdoc",
  -- config & text
	"json",
	"json5",
	"markdown",
	"markdown_inline",
	"yaml",
}

M.mason = {
	"bashls",
	"clangd",
	"cmake",
	"lua_ls",
	"pyright",
	"sqlls",
}

return M
