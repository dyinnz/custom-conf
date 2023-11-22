--------------------------------------------------------------------------------
-- Plug manager

local lazypath = vim.fn.expand("$HOME/.vim/lazy.nvim")
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- UI
	-- { "joshdick/onedark.vim",    priority = 1000 },         -- Ensure it loads first

	{
		"navarasu/onedark.nvim", -- S
		priority = 1000,
		config = function()
			require("colorscheme")
		end,
	},

	{
		"nvim-lualine/lualine.nvim", -- S
		opts = function()
			return require("config-lualine").opts
		end,
	},

	-- Sidebar
	-- { 'stevearc/aerial.nvim' } -- TODO: config me

	{
		"folke/noice.nvim", -- A
		event = "VeryLazy",
		opts = function()
			return require("config-noice").opts
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify", -- OPTIONAL:
		},
	},

	-- Highlight
	--{ "nvim-treesitter/nvim-treesitter", build = ": TSUpdate" },

	-- highlight the word under cursor -- TODO: lazy
	{
		"RRethy/vim-illuminate", -- B
		config = function()
			require("illuminate").configure({
				providers = { "lsp" },
			})
		end,
	},
	-- highlight TODO
	{ "folke/todo-comments.nvim" }, -- B
	-- highlight *.log
	{ "MTDL9/vim-log-highlighting", ft = "log" }, -- A

	-- Motion
	"christoomey/vim-tmux-navigator", -- A -- TODO: nvim version
	"justinmk/vim-sneak", -- B -- TODO: new

	-- Editing
	{
		"kylechui/nvim-surround", -- B
		version = "*",
		event = "VeryLazy",
		opts = {},
	},

	{
		"numToStr/Comment.nvim", -- B
		keys = {
			{ "gcc", mode = "n", desc = "Comment toggle current line" },
			{ "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
			{ "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
			{ "gbc", mode = "n", desc = "Comment toggle current block" },
			{ "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
			{ "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
		},
		opts = {
			padding = true,
		},
	},

	-- Keymap
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {},
	},

	-- Fuzzy Finder
	{
		"ibhagwan/fzf-lua", -- S
		cmd = { "FzfLua" },
		keys = {
			{ "<C-P>", "<cmd> FzfLua files <CR>" },
			{ "<Space>c", "<cmd> FzfLua commands <CR>", desc = "fuzzy - commands" },
			{ "<Space>ff", "<cmd> FzfLua builtin <CR>" },

			{ "<Space>fk", "<cmd> FzfLua keymaps <CR>", desc = "fuzzy - keymaps" },
			{
				"<Space>fl",
				"<cmd> lua require('fzf-lua').blines{ fzf_opts = { ['--layout'] = 'reverse' } } <CR>",
				desc = "fuzzy - lines",
			},
			{ "<Space>fs", "<cmd> FzfLua grep <CR>", desc = "fuzzy - grep" },
			{ "<Space>fw", "<cmd> FzfLua grep_cword <CR>", desc = "fuzzy - grep cword" },

			{ "<Space>lc", "<cmd> FzfLua lsp_incoming_calls <CR>", desc = "fuzzy - incomming calls" },
			{ "<Space>ld", "<cmd> FzfLua lsp_document_diagnostics <CR>", desc = "fuzzy - diagnostics" },
			{ "<Space>li", "<cmd> FzfLua lsp_implementations <CR>", desc = "fuzzy - implementations" },
			{ "<Space>lr", "<cmd> FzfLua lsp_references <CR>", desc = "fuzzy - references" },
			{ "<Space>ls", "<cmd> FzfLua lsp_document_symbols <CR>", desc = "fuzzy - symbols" },
			{ "<Space>lt", "<cmd> FzfLua lsp_typedefs <CR>", desc = "fuzzy - typedefs" },

			{ "<Space>gf", "<cmd> FzfLua git_files <CR>", desc = "fuzzy git files" },
			{ "<Space>gl", "<cmd> FzfLua git_bcommits <CR>", desc = "fuzzy - git log for buffer" },
			{ "<Space>gs", "<cmd> FzfLua git_status <CR>", desc = "fuzzy - git status" },
		},
		opts = {
			fzf_opts = { ["--layout"] = "default" },
			winopts = { width = 1.0, height = 0.62, row = 1.0, preview = { horizontal = "right:50%" } },
		},
	},

	-- Coding
	-- LSP
	{
		"neovim/nvim-lspconfig", -- S
		dependencies = {
			{ "williamboman/mason.nvim", PATH = "append" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			require("config-nvim-lspconfig").setup()
		end,
	},

	-- Code completion
	{
		"hrsh7th/nvim-cmp", -- S
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			-- snippet plugin
			{
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
			},
			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			return require("config-nvim-cmp").opts
		end,
	},

	-- Diagnostics
	{
		"folke/trouble.nvim", -- C
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- Format & Lint
	{
		"stevearc/conform.nvim", -- S
		keys = {
			{
				"=",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = { "n", "v" },
			},
		},
		opts = function()
			return require("config-conform").opts
		end,
	},

	-- cpp
	{
		"derekwyatt/vim-fswitch", -- B
		ft = { "cpp", "h" },
		cmd = { "FSHere", "FSSplitRight" },
	},

	-- Git
	{
		"lewis6991/gitsigns.nvim", -- A
		ft = { "gitcommit", "diff" },
		init = function()
			require("config-gitsigns").init()
		end,
		opts = function()
			return require("config-gitsigns").opts
		end,
	},

	{ "sindrets/diffview.nvim", cmd = { "DiffviewOpen", "DiffviewFileHistory" } }, -- C

	{ "tpope/vim-fugitive", event = "VeryLazy" }, -- C -- TODO: lazy cmd

	-- Terminal
	{
		"akinsho/toggleterm.nvim", -- C
		keys = {
			-- { "<F1>", "<cmd>exe 1 . 'ToggleTerm size=24' <CR>",                    mode = { "n", "i", "v", "t" } },
			-- { "<F3>", "<cmd>exe 3 . 'ToggleTerm size=80 direction=vertical' <CR>", mode = { "n", "i", "v", "t" } },
			{ "<F5>", "<cmd>exe 2 . 'ToggleTerm direction=float' <CR>", mode = { "n", "i", "v", "t" } },
		},
		config = function()
			require("toggleterm").setup()
		end,
		-- lazy = false,
	},

	{ "dstein64/vim-startuptime", cmd = "StartupTime" }, -- B
}, {
	root = vim.fn.expand("$HOME/.vim/plugged"),
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
			},
		},
	},
})

require("basic")
require("keymaps")
require("lsp")
require("misc")

require("conform").setup()
