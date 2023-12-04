local M = {}

M.git_root = vim.fn.system(" git rev-parse --show-toplevel "):gsub("%s+$", "") .. "/"
if not M.git_root:find("^/") then
	M.git_root = "./"
end

_G.P = {}

return M
