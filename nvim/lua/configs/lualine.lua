local M = {}

M.opts = {
	options = {
		path = 1, -- relative path
		-- icons_enabled = false,
		section_separators = "", -- save space
		component_separators = "",
	},
	tabline = {
		lualine_a = {
			{
				"tabs",
				tab_max_length = 24,
				max_length = 240,
				-- 0: Shows tab_nr
				-- 1: Shows tab_name
				-- 2: Shows tab_nr + tab_name
				mode = 2,
				path = 1,
			},
		},
	},
}

return M
