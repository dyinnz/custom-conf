--------------------------------------------------------------------------------
-- Plug manager

local lazypath = vim.fn.expand('$HOME/.vim/lazy.nvim')
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- UI
    -- { "joshdick/onedark.vim",    priority = 1000 },         -- Ensure it loads first
    { "navarasu/onedark.nvim", priority = 1000 },
    -- { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
      'nvim-lualine/lualine.nvim',
      opts = {
        options = {
          icons_enabled = false, section_separators = '', component_separators = '',
        },
        tabline = {
          lualine_a = {
            { 'tabs', tab_max_length = 24, max_length = 240, mode = 1, path = 1, },
          },
        },
      }
    },
    'sheerun/vim-polyglot', -- TODO: new

    -- Sidebar
    { 'preservim/tagbar',      cmd = 'Tagbar' }, -- TODO: nvim version
    { 'scrooloose/nerdtree',   cmd = 'NERDTreeToggle' }, -- TODO: nvim version

    -- Motion
    'christoomey/vim-tmux-navigator', -- TODO: nvim version
    'justinmk/vim-sneak', -- TODO: new

    -- Editing
    {
      "kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup()
      end
    },
    { 'scrooloose/nerdcommenter', event = 'VeryLazy' }, -- TODO: nvim version
    {
      'Chiel92/vim-autoformat',  -- TODO: nvim version
      keys = {
        { '=', ': Autoformat <CR>', 'n' }
      }
    },

    -- Fuzzy Finder
    { 'junegunn/fzf',             dir = '~/.fzf',    build = './install --bin' },
    { 'junegunn/fzf.vim', },

    -- Complete & Language
    { 'neoclide/coc.nvim',        branch = 'master', build = 'npm ci' },
    'antoinemadec/coc-fzf',
    -- cpp
    { 'derekwyatt/vim-fswitch',   ft = { 'cpp', 'h' },                            event = "VeryLazy" }, -- TODO: lazy cmd

    -- Git
    {
      "lewis6991/gitsigns.nvim",
      config = function()
        require('gitsigns').setup {
          current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 80,
            ignore_whitespace = false,
            virt_text_priority = 100,
          },
        }
      end
    },
    { 'sindrets/diffview.nvim', cmd = { 'DiffviewOpen', 'DiffviewFileHistory' } },
    { 'tpope/vim-fugitive',     event = "VeryLazy" }, -- TODO: lazy cmd

    -- Utility
    { 'dstein64/vim-startuptime', cmd = "StartupTime", },
  },
  {
    root = vim.fn.expand('$HOME/.vim/plugged'),
  })

--------------------------------------------------------------------------------
-- Basic settings

vim.opt.synmaxcol = 400
vim.opt.lazyredraw = true
vim.opt.scrolloff = 3 -- Minimum lines to keep above and below cursor
vim.opt.wrap = false

-- Complete popup menu
vim.opt.pumheight = 8

-- Shell and terminal
vim.opt.shell = "/bin/bash"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.cmd.autocmd("BufWinEnter,WinEnter term://* startinsert")
-- TODO
-- vim.cmd.autocmd("TermClose * bd!")

-- Tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.mouse = ""

if (vim.fn.has("unix") and not vim.fn.has("macunix")) then
  vim.opt.clipboard = "unnamedplus"
end

--------------------------------------------------------------------------------
-- Key mappings

--------------------------------------------------------------------------------
-- command abbr
-- no one is really happy until you have this shortcuts
-- vim.keymap.set('ca', 'Q!', 'q!')
-- vim.keymap.set('ca', 'Q', 'q')
-- vim.keymap.set('ca', 'Qall!', 'qall!')
-- vim.keymap.set('ca', 'Qall', 'qall')
-- vim.keymap.set('ca', 'W!', 'w!')
-- vim.keymap.set('ca', 'W', 'w')
-- vim.keymap.set('ca', 'WQ', 'wq')
-- vim.keymap.set('ca', 'Wa', 'wa')
-- vim.keymap.set('ca', 'Wq', 'wq')
-- vim.keymap.set('ca', 'wQ', 'wq')

vim.cmd("cnoreabbrev W! w!")
vim.cmd("cnoreabbrev Q! q!")
vim.cmd("cnoreabbrev Qall! qall!")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev Wa wa")
vim.cmd("cnoreabbrev wQ wq")
vim.cmd("cnoreabbrev WQ wq")
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Qall qall")


--------------------------------------------------------------------------------
-- map
vim.keymap.set('', '<C-A>', '^')
vim.keymap.set('i', '<C-A>', '<ESC>I')
vim.keymap.set('', '<C-E>', '$')
vim.keymap.set('i', '<C-E>', '<ESC>A')

vim.keymap.del('', 's')
vim.keymap.del('', 'S')
vim.keymap.set('', 'f', '<Plug>Sneak_s')
vim.keymap.set('', 'F', '<Plug>Sneak_S')

--------------------------------------------------------------------------------
-- visual mode

-- continuous shift
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
-- easy align
vim.keymap.set('v', '<leader>a', '<Plug>(EasyAlign)')

--------------------------------------------------------------------------------
-- normal mode

vim.keymap.set('n', '<Tab>', 'gt')
vim.keymap.set('n', '<S-Tab>', 'gT')

-- Search mappings: These will make it so that going to the next one in a
-- search will center on the line it's found in.
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', 'XX', '"+cc<CR>')
vim.keymap.set('n', 'Xx', '"+cc<CR>')
vim.keymap.set('n', 'YY', '"+yy<CR>')
vim.keymap.set('n', 'Yy', '"+yy<CR>')
vim.keymap.set('n', '<leader>p', '"+gp<CR>')

-- Space

vim.keymap.set('n', '<space>q', ':q<CR>')
vim.keymap.set('n', '<space>Q', ':q!<CR>')

-- Window
vim.keymap.set('n', '<Space>=', ':vertical resize +10<CR>')
vim.keymap.set('n', '<Space>-', ':vertical resize -10<CR>')

vim.keymap.set('n', '<Space>WS', ':sp term://.//zsh<CR>')
vim.keymap.set('n', '<Space>WV', ':vs term://.//zsh<CR>')
vim.keymap.set('n', '<Space>wc', ':close<CR>')
vim.keymap.set('n', '<Space>wn', ':NERDTreeToggle<CR>')
vim.keymap.set('n', '<Space>wo', ':only<CR>')
vim.keymap.set('n', '<Space>ws', ':sp<CR>')
vim.keymap.set('n', '<Space>wt', ':Tagbar<CR>')
vim.keymap.set('n', '<Space>wv', ':vs<CR>')

-- Tab
vim.keymap.set('n', '<Space>TT', ':tabe term://.//zsh<CR>')
vim.keymap.set('n', '<Space>tc', ':tabclose<CR>')
vim.keymap.set('n', '<Space>tn', ':tabnext<CR>')
vim.keymap.set('n', '<Space>to', ':tabonly<CR>')
vim.keymap.set('n', '<Space>tp', ':tabprev<CR>')
vim.keymap.set('n', '<Space>tt', ':tab split<CR>')

vim.keymap.set('n', '<Space>0', '0gt<CR>')
vim.keymap.set('n', '<Space>1', '1gt<CR>')
vim.keymap.set('n', '<Space>2', '2gt<CR>')
vim.keymap.set('n', '<Space>3', '3gt<CR>')
vim.keymap.set('n', '<Space>4', '4gt<CR>')
vim.keymap.set('n', '<Space>5', '5gt<CR>')
vim.keymap.set('n', '<Space>6', '6gt<CR>')
vim.keymap.set('n', '<Space>7', '7gt<CR>')
vim.keymap.set('n', '<Space>8', '8gt<CR>')
vim.keymap.set('n', '<Space>9', '9gt<CR>')

--Buffer
vim.keymap.set('n', '<Space>bd', ':bd<CR>')
vim.keymap.set('n', '<Space>bn', ':bn<CR>')
vim.keymap.set('n', '<Space>bp', ':bp<CR>')
vim.keymap.set('n', '<Space>bw', ':w<CR>')

-- FZF
vim.keymap.set('n', '<C-P>', ': Files<CR>')
vim.keymap.set('n', '<Space>o', ': Files<CR>')
vim.keymap.set('n', '<Space>ff', ': Files<CR>')
vim.keymap.set('n', '<Space>fg', ': GFiles<CR>')
vim.keymap.set('n', '<Space>fb', ': Buffers<CR>')
vim.keymap.set('n', '<Space>ft', ': BTags<CR>')
vim.keymap.set('n', '<Space>fs', ': Rg! ')
vim.keymap.set('n', '<Space>fw', ': Rg <C-R><C-W><CR>')


vim.keymap.set('n', '<Space>gh', ':DiffviewFileHistory ')
vim.keymap.set('n', '<Space>gd', ':DiffviewOpen ')
vim.keymap.set('n', '<Space>gc', ':DiffviewClose<CR>')
vim.keymap.set('n', '<Space>gb', function()
  vim.cmd('Gitsigns toggle_current_line_blame')
  vim.cmd('set nonumber!')
end)

-- begin with <leader>
vim.keymap.set('n', '<leader>w', ':w<CR>')

-- vim.keymap.set('n', '=', ': Autoformat<CR>')
vim.keymap.set('n', '<leader>ft', ': Autoformat<CR>')

--------------------------------------------------------------------------------
-- terminal mode

vim.keymap.del('n', '<C-Bslash>') -- remove vim-tmux-navigator keymap
vim.keymap.set('t', '<Esc>', '<C-Bslash><C-N>')
vim.keymap.set('t', '<C-H>', '<C-Bslash><C-N><C-W>h')
vim.keymap.set('t', '<C-J>', '<C-Bslash><C-N><C-W>j')
vim.keymap.set('t', '<C-K>', '<C-Bslash><C-N><C-W>k')
vim.keymap.set('t', '<C-L>', '<C-Bslash><C-N><C-W>l')


--------------------------------------------------------------------------------
-- Setup plugged

require('colorscheme')

require('coc-config')

--------------------------------------------------------------------------------
-- variable

-- fzf
vim.g.fzf_layout = { down = '60%' }
-- fzf-preview
vim.g.fzf_preview_direct_window_option = { width = 1.0, height = 0.66, relative = true, yoffset = 1.0 }
-- coc-fzf
vim.g.coc_fzf_opts = { "--height=60%" }

-- tagbar
vim.g.tagbar_position = 'topleft vertical'

--------------------------------------------------------------------------------
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

-- fswitch
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.h' },
  command = 'let b:fswitchdst = "cpp,cc,c,m"'
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.cpp' },
  command = 'let b:fswitchdst = "h,hpp"'
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
