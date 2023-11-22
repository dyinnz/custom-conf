local M = {}

M.init = function()
	-- load gitsigns only when a git file is opened
	vim.api.nvim_create_autocmd({ "BufRead" }, {
		group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
		callback = function()
			vim.fn.system("git -C " .. '"' .. vim.fn.expand("%:p:h") .. '"' .. " rev-parse")
			if vim.v.shell_error == 0 then
				vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
				vim.schedule(function()
					require("lazy").load({ plugins = { "gitsigns.nvim" } })
				end)
			end
		end,
	})
end

M.opts = {
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 80,
		ignore_whitespace = false,
		virt_text_priority = 100,
	},
}

return M
