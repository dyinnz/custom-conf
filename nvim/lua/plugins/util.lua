local my_shell = "/bin/zsh"
if vim.fn.has("unix") and not vim.fn.has("macunix") then
	my_shell = "/usr/bin/zsh"
end

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
			{ "<C-Bslash>", "<cmd>ToggleTerm size=20<CR>", mode = { "n", "i", "v", "t" } },
			{ "«", "<cmd>ToggleTerm size=20<CR>", mode = { "n", "i", "v", "t" } },
			{ "¡", "<cmd>exe 1 . 'ToggleTerm size=20' <CR>", mode = { "n", "i", "v", "t" } },
			{ "™", "<cmd>exe 2 . 'ToggleTerm size=20' <CR>", mode = { "n", "i", "v", "t" } },
			{ "£", "<cmd>exe 3 . 'ToggleTerm size=20' <CR>", mode = { "n", "i", "v", "t" } },
			{ "¢", "<cmd>exe 4 . 'ToggleTerm size=20' <CR>", mode = { "n", "i", "v", "t" } },
			{ "ƒ", "<cmd>exe 99 . 'ToggleTerm direction=float' <CR>", mode = { "n", "i", "v", "t" } },
		},
		opts = {
			shell = my_shell,
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)
		end,
	},

	-- Project
	{
		"ahmedkhalf/project.nvim", -- C
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "<space>pr", "<cmd>ProjectRoot<cr>")

			require("project_nvim").setup({
				patterns = { "=src", ".git" },
				manual_mode = true,
				silent_chdir = false,
			})
		end,
	},

	{
		"stevearc/oil.nvim",
		event = "VeryLazy",
		opts = {
			keymaps = {
				["<C-v>"] = "actions.preview",
				["<C-p>"] = false,
				["<C-h>"] = false,
			},
		},
	},
}
