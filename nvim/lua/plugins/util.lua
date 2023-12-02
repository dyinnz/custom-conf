return {
	{ "dstein64/vim-startuptime", cmd = "StartupTime" }, -- B

	{
		"sakhnik/nvim-gdb", -- S
		keys = {
			{ "<space>dd", "::GdbStartLLDB lldb ", desc = "start lldb" },
		},
		config = function()
			vim.g.nvimgdb_disable_start_keymaps = true
			vim.g.nvimgdb_config_override = {
				key_continue = "<F5>",
				key_until = "<F6>",
				key_breakpoint = "<F9>",
				key_next = "<F10>",
				key_step = "<F11>",
				key_finish = "<F12>",
				key_frameup = "<",
				key_framedown = ">",
				key_eval = "<C-M>",
				key_quit = nil,
				set_tkeymaps = function()
					NvimGdb.here.keymaps:set_t()
					vim.api.nvim_buf_del_keymap(vim.api.nvim_get_current_buf(), "t", "<Esc>")
				end,
				set_keymaps = function()
					NvimGdb.here.keymaps:set()
				end,
				unset_keymaps = function()
					NvimGdb.here.keymaps:unset()
				end,
			}
		end,
	},

	-- Terminal
	{
		"akinsho/toggleterm.nvim", -- C
		keys = {
			{ "<C-Bslash>", "<cmd>exe 2 . 'ToggleTerm direction=float' <CR>", mode = { "n", "i", "v", "t" } },
		},
		opts = {
			shell = vim.o.shell,
		},
	},

	-- Project
	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
		config = function()
			require("project_nvim").setup({
				patterns = { "=src", ".git" },
			})
		end,
	},
}
