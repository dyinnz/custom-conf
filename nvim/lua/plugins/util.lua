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
			{ "∂", "<cmd>LLDBStart <cr>", desc = "start lldb" }, -- A-D
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

			vim.api.nvim_create_user_command("LLDBStart", function()
				local file = ""
				if P.test_binary then
					file = require("util").git_root .. P.test_binary
				end
				local cmd = "GdbStartLLDB lldb " .. file
				vim.cmd(cmd)
				vim.notify(cmd)
			end, { nargs = "*" })
		end,
	},

	-- Terminal
	{
		"akinsho/toggleterm.nvim", -- C
		keys = {
			{ "«", "<cmd>ToggleTerm<CR>", mode = { "n", "i", "v", "t" } },
			{ "¡", "<cmd>exe 1 . 'ToggleTerm' <CR>", mode = { "n", "i", "v", "t" } }, -- A-1
			{ "™", "<cmd>exe 2 . 'ToggleTerm' <CR>", mode = { "n", "i", "v", "t" } }, -- A-2
			{ "£", "<cmd>exe 3 . 'ToggleTerm' <CR>", mode = { "n", "i", "v", "t" } }, -- A-3
			{ "ƒ", "<cmd>exe 99 . 'ToggleTerm direction=float' <CR>", mode = { "n", "i", "v", "t" } }, -- A-9

			{ "†", "<cmd> ToggleTestTerm <CR>", mode = { "n", "i", "v", "t" } }, -- A-T
			{ "•", "<cmd> ToggleTestTerm <CR>", mode = { "n", "i", "v", "t" } }, -- A-8
			{ "ª", "<cmd> ToggleBuildTerm <CR>", mode = { "n", "i", "v", "t" } }, -- A-9

			-- build
			{ "®", "<cmd> ToggleTesting <CR>", mode = { "n", "i", "v", "t" } }, -- A-B
			{ "∫", "<cmd> ToggleBuilding <CR>", mode = { "n", "i", "v", "t" } }, -- A-B
		},
		opts = {
			shell = my_shell,
			size = function(term)
				if term.direction == "horizontal" then
					return 20
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.42
				end
			end,
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)

			local util = require("util")

			vim.api.nvim_create_user_command("ToggleTesting", function()
				local cmd = "echo please test_dir, test_cmd "
				local dir = "."
				if P.test_cmd and P.test_dir then
					cmd = P.test_cmd
					dir = util.git_root .. P.test_dir
				end
				require("toggleterm").exec(cmd, 8, nil, dir)
			end, { nargs = "*" })

			vim.api.nvim_create_user_command("ToggleBuilding", function()
				local cmd = "ninja"
				if P.build_cmd then
					cmd = P.build_cmd
				end
				require("toggleterm").exec(cmd, 9)
			end, { nargs = "*" })

			vim.api.nvim_create_user_command("ToggleTestTerm", function()
				local dir = "."
				if P.test_dir then
					dir = util.git_root .. P.test_dir
				end
				require("toggleterm").toggle(8, nil, dir, "horizontal", "test")
			end, { nargs = "*" })

			vim.api.nvim_create_user_command("ToggleBuildTerm", function()
				local dir = "."
				if P.build_dir then
					dir = util.git_root .. P.build_dir
				end
				require("toggleterm").toggle(9, nil, dir, "horizontal", "build")
			end, { nargs = "*" })
		end,
	},

	-- Project
	{
		"ahmedkhalf/project.nvim", -- C
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "<space>pr", "<cmd>ProjectRoot<CR>")

			require("project_nvim").setup({
				patterns = { "=src", ".git" },
				manual_mode = true,
				silent_chdir = false,
			})
		end,
	},

	{
		"klen/nvim-config-local",
		event = "VeryLazy",
		config = function()
			local config_in_git = require("util").git_root .. ".nvim.lua"
			require("config-local").setup({
				config_files = { config_in_git, ".nvim.lua" },
			})

			require("config-local").source()
		end,
	},

	-- File explorer
	{
		"stevearc/oil.nvim", -- B
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
