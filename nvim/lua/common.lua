_G.PROJECT_CONFIG = {
	build_dir = "build/",
	build_cmd = "ninja -j 8",
	test_dir = "build/",
	test_binary = "a.out",
	test_cmd = "./a.out",
	exclude = {
		"*.dat",
		"*.data",
		"*.parquet",
	},
}

local M = {}

M.project_config = _G.PROJECT_CONFIG

M.git_root = vim.fn.system(" git rev-parse --show-toplevel "):gsub("%s+$", "") .. "/"
if not M.git_root:find("^/") then
	M.git_root = "./"
end

return M
