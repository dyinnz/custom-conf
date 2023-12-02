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

vim.cmd([[
function StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

nnoremap <leader>ds     : call StripTrailingWhitespace()<CR>
]])
