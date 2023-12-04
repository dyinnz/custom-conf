-- FIXME: https://github.com/neovim/neovim/issues/23522
-- vim.filetype.add({
--   extension = {
--     cppm = "cpp",
--     cpp = "cppm",
--   },
-- })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.cppm",
	command = "setfiletype cpp",
})

vim.cmd("au BufRead,BufNewFile *.tpp setlocal filetype=cpp")

-- fswitch
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.h" },
	command = 'let b:fswitchdst = "cpp,cc,c,m"',
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.cpp" },
	command = 'let b:fswitchdst = "h,hpp"',
})
