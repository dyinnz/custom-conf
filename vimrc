"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim and neovim configuration file

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" be iMproved, required
set nocompatible
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Plugins
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'      " let Vundle manage Vundle, required

" UI / Highlight
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
" Plugin 'itchyny/lightline.vim'

" Move
Plugin 'easymotion/vim-easymotion'
Plugin 'christoomey/vim-tmux-navigator'

" Edit
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'

" Search
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'

" Cpp
Plugin 'vim-scripts/a.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Valloric/YouCompleteMe'

" Python
Plugin 'klen/python-mode'

" Lint
" Plugin 'w0rp/ale'

call vundle#end()

filetype plugin indent on    " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
color solarized             " Load a colorscheme


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important for Line Number Bar
syntax on
set background=dark

set shell=/home/guoyingzhong/local/bin/zsh
autocmd BufWinEnter,WinEnter term://* startinsert

" About indent
" set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" UI
set number
" set wildmenu
set scrolloff=3 " Minimum lines to keep above and below cursor

" Color
" highlight Folded term=bold cterm=bold
highlight clear VertSplit
highlight clear SignColumn        " link to LineNr
highlight clear LineNr            " Line Number
" highlight clear SpecialKey        " for listchars
highlight clear StatusLine
highlight StatusLine ctermfg=33 guifg=Cyan
highlight clear WildMenu
highlight WildMenu ctermfg=136 gui=bold guifg=#60ff60

if has('nvim')
  " nothing
else
  syntax on
  " UI
  set ttyfast " Speed up
  set showcmd
  set wildmenu
  " Search
  set smartcase
  set incsearch
  set hlsearch
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mapping
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

tnoremap <C-Q>   <C-\><C-n> :tabprev<CR>
tnoremap <C-E>   <C-\><C-n> :tabnext<CR>
nnoremap <C-Q>   :tabprev<CR>
nnoremap <C-E>   :tabnext<CR>

nnoremap <leader>t      : tabnew<CR>
nnoremap <leader>w      : tabclose<CR>

nnoremap <Space>h       : bn<CR>
nnoremap <Space>l       : bp<CR>
nnoremap <Space>b       : CtrlPBuffer<cr>

nnoremap <leader>nt     : NERDTreeToggle<CR>
nnoremap <leader>ctags  : !ctags -R && echo "Create tags OK..."<CR>
nnoremap <leader>al     : call AddDashLine()<CR>
nnoremap <leader>ds     : call StripTrailingWhitespace()<CR>

nnoremap <leader><space>  <Plug>NERDCommenterToggle

nnoremap <Leader>= :vertical resize +10<CR>
nnoremap <Leader>- :vertical resize -10<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function

function AddDashLine()
  call append(line(".")+0, "/*-------------------------------------------------------------------------*/")
endfunction

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

" cpp highlight
let g:cpp_class_scope_highlight=1
let g:cpp_experimental_template_highlight=1

" YouCompleteMe
let g:ycm_show_diagnostics_ui=0
let g:ycm_enable_diagnostic_signs=0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_invoke_completion = '<C-Q>'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" CtrlP
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v(\.git|(CM|cm)ake\w+|tmp|node_modules|googletest)$',
      \ 'file': '\v(\.o|tags|\.class)$',
      \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
      \ }

" Python
let g:pymode_python = 'python3'
let g:pymode_lint = 0

" MacOS clang
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'

