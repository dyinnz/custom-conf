local M = {}

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")

local custom_filter = function(entry, ctx)
	if ctx.filetype ~= "cpp" then
		return true
	end

	local s = entry.completion_item.insertText
	return not (
		s:sub(-1) == "-"
		or s:find("^boost")
		-- or s:find("^absl::")
		or s:find("^arrow::")
		or s:find("^clang::")
		or s:find("^kudu::")
		or s:find("^llvm::")
		or s:find("^Aws::")
	)
end

M.opts = {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "buffer" },
		{ name = "luasnip" },
		{ name = "nvim_lsp", entry_filter = custom_filter },
		{ name = "nvim_lua" },
		{ name = "path" },
	},
	--- @diagnostic disable-next-line: missing-fields
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.recently_used,
			cmp.config.compare.score,
			cmp.config.compare.locality,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	-- diagnostics = {
	-- 	update_in_insert = true,
	-- },
	mapping = {
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
			-- that way you will only jump inside the snippet region
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
}

M.setup = function(opts)
	cmp.setup(opts)

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	--- @diagnostic disable-next-line: missing-fields
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	--- @diagnostic disable-next-line: missing-fields
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end

return M
