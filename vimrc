"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim and neovim configuration file
" Dyinnz 2017/10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install vim-plug
if has('nvim')
  let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
else
  let vimplug_exists=expand('~/.vim/autoload/plug.vim')
endif

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

  autocmd VimEnter * PlugInstall
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install packages by vim-plug
call plug#begin('~/.vim/plugged')

" Color theme
Plug 'joshdick/onedark.vim'
" Code highlight
Plug 'sheerun/vim-polyglot'

" UI
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'preservim/tagbar' , { 'on': 'Tagbar' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Move
Plug 'christoomey/vim-tmux-navigator'
Plug 'justinmk/vim-sneak'

" Edit
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'Chiel92/vim-autoformat'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Lint
" Plug 'dense-analysis/ale', { 'for': 'python' }

" Complete
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
Plug 'antoinemadec/coc-fzf'

" Cpp
Plug 'derekwyatt/vim-fswitch'

" Python
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" Git
Plug 'tpope/vim-fugitive'

" Plug 'github/copilot.vim'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme
set background=dark " require
colorscheme onedark

set synmaxcol=400
set lazyredraw
set scrolloff=3 " Minimum lines to keep above and below cursor
set nowrap

" Shell and terminal
set shell=/bin/bash
autocmd BufWinEnter,WinEnter term://* startinsert
set splitbelow
set splitright

" Tabs
set tabstop=2
set shiftwidth=0
set softtabstop=2
set expandtab
set smarttab

"" Enable hidden buffers
set hidden

set smartcase
set ignorecase

set mouse=

set tags=../.tags;,.tags;,tags
set completeopt=menu " disable preview window (would be show below)

set pumheight=24

if has('nvim')
  autocmd TermClose * bd!
else
  set autoindent
  " UI
  set ttyfast " Speed up
  set showcmd
  set wildmenu
  " Search
  set incsearch
  set hlsearch
  set backspace=indent,eol,start
endif

if has('unix') && !has('macunix')
  set clipboard=unnamedplus
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mapping

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

map f                   <Plug>Sneak_s
map F                   <Plug>Sneak_S

" continuous shift
vmap <                  <gv
vmap >                  >gv

noremap YY              "+yy<CR>
noremap Yy              "+yy<CR>
noremap XX              "+cc<CR>
noremap Xx              "+cc<CR>
noremap <leader>p       "+gp<CR>

nnoremap <Tab>          gt
nnoremap <S-Tab>        gT

if has('nvim')
  tnoremap <Esc>        <C-\><C-N>
  tnoremap <C-H>        <C-\><C-N><C-W>h
  tnoremap <C-J>        <C-\><C-N><C-W>j
  tnoremap <C-K>        <C-\><C-N><C-W>k
  tnoremap <C-L>        <C-\><C-N><C-W>l
endif

map   <C-A>             ^
imap  <C-A>             <ESC>I
map   <C-E>             $
imap  <C-E>             <ESC>A

" Begin with <Space>
nnoremap <Space>q       : q<CR>
nnoremap <Space>Q       : q!<CR>

" Window
nnoremap <Space>=       : vertical resize +10<CR>
nnoremap <Space>-       : vertical resize -10<CR>

nnoremap <Space>wv      : vs<CR>
nnoremap <Space>ws      : sp<CR>
nnoremap <Space>wc      : close<CR>
nnoremap <Space>wo      : only<CR>
nnoremap <Space>WV      : vs term://.//zsh<CR>
nnoremap <Space>WS      : sp term://.//zsh<CR>
autocmd FileType c,cpp nnoremap <Space>a       : FSHere<CR>
autocmd FileType c,cpp nnoremap <Space>wa      : FSSplitRight<CR>
nnoremap <Space>wt      : Tagbar<CR>
nnoremap <Space>wn      : NERDTreeToggle<CR>

" Tab
nnoremap <Space>tt      : tab split<CR>
nnoremap <Space>tc      : tabclose<CR>
nnoremap <Space>to      : tabonly<CR>
nnoremap <Space>TT      : tabe term://.//zsh<CR>
nnoremap <Space>tn      : tabnext<CR>
nnoremap <Space>tp      : tabprev<CR>

nnoremap <Space>0       0gt<CR>
nnoremap <Space>1       1gt<CR>
nnoremap <Space>2       2gt<CR>
nnoremap <Space>3       3gt<CR>
nnoremap <Space>4       4gt<CR>
nnoremap <Space>5       5gt<CR>
nnoremap <Space>6       6gt<CR>
nnoremap <Space>7       7gt<CR>
nnoremap <Space>8       8gt<CR>
nnoremap <Space>9       9gt<CR>

" Buffer
nnoremap <Space>bw      : w<CR>
nnoremap <Space>bd      : bd<CR>
nnoremap <Space>bn      : bn<CR>
nnoremap <Space>bp      : bp<CR>

" FZF
autocmd FileType fzf tnoremap <buffer> <Esc> <C-C>
autocmd FileType fzf tnoremap <buffer> <C-J> <C-N>
autocmd FileType fzf tnoremap <buffer> <C-K> <C-P>

nnoremap <C-P>          : Files<CR>
" nnoremap <C-M>          : Buffers<CR>
nnoremap <Space>o       : Files<CR>
nnoremap <Space>ff      : Files<CR>
nnoremap <Space>fg      : GFiles<CR>
nnoremap <Space>fb      : Buffers<CR>
nnoremap <Space>ft      : BTags<CR>
" nnoremap <Space>fl      : BLines<CR>
nnoremap <Space>fs      : Rg! 
nnoremap <Space>fw      : Rg <C-R><C-W><CR>

" begin with <leader>
nnoremap <leader>w       : w<CR>
nnoremap <leader>ds     : call StripTrailingWhitespace()<CR>

noremap  <leader>ft     : Autoformat<CR>
autocmd BufRead,BufNewFile *.cppm setlocal filetype=cpp
autocmd FileType c,cpp noremap <buffer> = : Autoformat<CR>

nnoremap <leader>fix    : ALEFix <CR>
nmap <Space>fk          <Plug>(ale_previous_wrap)
nmap <Space>fj          <Plug>(ale_next_wrap)

vmap <leader>a          <Plug>(EasyAlign)

cnoremap <expr> %%      getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

imap <silent><script><expr> <C-F>  copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme='onedark'

" fswitch
au BufEnter *.h  let b:fswitchdst = "cpp,cc,c,m"
au BufEnter *.cc let b:fswitchdst = "h,hpp"

" ale
let g:ale_linters = {
      \ 'python': ['pylint'],
      \}
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'python': ['isort', 'pycln', 'black'],
      \}
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1


" fzf
let g:fzf_layout = { 'down': '60%' }
" fzf-preview
let g:fzf_preview_direct_window_option = { 'width': 1.0, 'height': 0.66, 'relative': v:true, 'yoffset': 1.0 }
let g:fzf_preview_default_fzf_options = { '--reverse': v:false }
" coc-fzf
let g:coc_fzf_opts = ["--height=60%"]

" tagbar
let g:tagbar_position = 'topleft vertical'

source ~/.custom-conf/coc.vimrc
