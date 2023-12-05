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
				local common = require("common")
				local pc = common.project_config

				-- save the cwd
				local prev_cwd = vim.fn.getcwd()
				vim.api.nvim_set_current_dir(common.git_root)

				local file = pc.test_dir .. pc.test_binary
				vim.ui.input({ prompt = "file to debug: ", default = file, completion = "file" }, function(input)
					if input then
						local relative = vim.fn.fnamemodify(input, ":h")
						vim.api.nvim_set_current_dir(relative)

						local cmd = "GdbStartLLDB lldb " .. vim.fn.fnamemodify(input, ":t")
						vim.notify(cmd .. " in " .. relative)
						vim.cmd(cmd)
					end
				end)

				vim.api.nvim_set_current_dir(prev_cwd)
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
			{ "®", "<cmd> ToggleTesting <CR>", mode = { "n", "i", "v", "t" } }, -- A-R
			{ "∫", "<cmd> ToggleBuilding <CR>", mode = { "n", "i", "v", "t" } }, -- A-B
		},
		opts = {
			shell = my_shell,
			size = function(term)
				if term.direction == "horizontal" then
					return 22
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.42
				end
			end,
			on_exit = function(t, job, exit_code, name)
				vim.notify("Terminal " .. t.display_name .. " exited.. ")
			end,
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)

			local test_id = 8
			local build_id = 9
			local common = require("common")

			vim.api.nvim_create_user_command("ToggleTesting", function()
				local pc = require("common").project_config
				local dir = common.git_root .. pc.test_dir
				require("toggleterm").toggle(test_id, nil, dir, nil, "test")
				require("toggleterm").exec(pc.test_cmd, test_id, nil, dir, nil, "test")
			end, { nargs = "*" })

			vim.api.nvim_create_user_command("ToggleBuilding", function()
				local pc = require("common").project_config
				local dir = common.git_root .. pc.build_dir
				require("toggleterm").toggle(build_id, nil, dir, nil, "build")
				require("toggleterm").exec(pc.build_cmd, build_id, nil, dir, nil, "build")
			end, { nargs = "*" })

			vim.api.nvim_create_user_command("ToggleTestTerm", function()
				local pc = require("common").project_config
				local dir = common.git_root .. pc.test_dir
				require("toggleterm").toggle(test_id, nil, dir, nil, "test")
			end, { nargs = "*" })

			vim.api.nvim_create_user_command("ToggleBuildTerm", function()
				local pc = require("common").project_config
				local dir = common.git_root .. pc.build_dir
				require("toggleterm").toggle(build_id, nil, dir, nil, "build")
			end, { nargs = "*" })
		end,
	},

	{
		"klen/nvim-config-local",
		event = "VeryLazy",
		config = function()
			local config_in_git = require("common").git_root .. ".nvim.lua"
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
