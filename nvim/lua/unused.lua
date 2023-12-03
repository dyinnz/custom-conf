local telescope = {
	"nvim-telescope/telescope.nvim",
	enabled = false,
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
	},
	keys = {
		{ "<C-P>", "<cmd> Telescope find_files <CR>" },
	},
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = { ["<esc>"] = actions.close },
				},
				layout_config = {
					width = 0.9,
					preview_width = 0.45,
				},
				scroll_strategy = "limit",
			},
		})
		require("telescope").load_extension("fzf")
	end,
}

local nvim_bqf = {
	"kevinhwang91/nvim-bqf", -- C
	event = "VeryLazy",
	opts = {
		preview = {
			winblend = 0, -- 0 for opaque window
		},
	},
}

-- Debug
-- {
--   "mfussenegger/nvim-dap",
--   keys = {
--     { "<space>db", "<cmd> lua require'dap'.toggle_breakpoint() <CR>", "n" },
--     { "<space>dc", "<cmd> lua require'dap'.continue() <CR>",          "n" },
--     { "<space>ds", "<cmd> lua require'dap'.step_over() <CR>",         "n" },
--     { "<space>di", "<cmd> lua require'dap'.step_into() <CR>",         "n" },
--     { "<space>dr", "<cmd> lua require'dap'.repl.open() <CR>",         "n" },
--   },

--   config = function()
--     local dap = require("dap")
--     dap.adapters.lldb = {
--       type = "executable",
--       command = "/opt/homebrew/opt/llvm/bin/lldb-vscode", -- adjust as needed, must be absolute path
--       name = "lldb",
--     }

--     dap.configurations.cpp = {
--       {
--         name = "Launch",
--         type = "lldb",
--         request = "launch",
--         program = function()
--           return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--         end,
--         cwd = "${workspaceFolder}",
--         stopOnEntry = false,
--         args = "",
--       },
--     }
--   end,
-- },
-- {
--   "rcarriga/nvim-dap-ui",
--   config = function()
--     require("dapui").setup()
--   end,
-- },

-- Tools
-- {
--  "nvim-tree/nvim-tree.lua",
--  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
--  config = function()
--    require("nvim-tree").setup()
--  end,
-- },
