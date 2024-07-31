local M = {}

local test_id = 8
local build_id = 9

local common = require("common")
local pc = common.project_config


local Terminal  = require('toggleterm.terminal').Terminal


local a = Terminal::new({
})
-- a.cm

-- a.shutdown


-- vim.api.nvim_create_user_command("ToggleTesting", function()
-- 	local dir = common.git_root .. pc.test_dir
-- 	require("toggleterm").exec(pc.test_cmd, test_id, nil, dir)
-- end, { nargs = "*" })

return M
