"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim and neovim configuration file

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Color & Highlight
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'

" UI
Plug 'vim-airline/vim-airline'
" Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'

" Move
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'

" Edit
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'

" Search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'junegunn/fzf.vim'

" Lint
Plug 'w0rp/ale'

" Cpp
Plug 'vim-scripts/a.vim', { 'for': 'cpp' }
Plug '~/.vim/YouCompleteMe'

" Python
Plug 'klen/python-mode', { 'for': 'python' }

call plug#end()

filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color
syntax on
colorscheme onedark
set background=dark

" shell and terminal
set shell=/bin/zsh
" set shell=/home/guoyingzhong/local/bin/zsh
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd TermClose * bd!
set splitbelow
set splitright

" About indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" UI
set number
set scrolloff=3 " Minimum lines to keep above and below cursor

if has('nvim')
  " nothing
else
  set autoindent
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

nnoremap <CR> :

nnoremap <leader>t      : tabnew<CR>
nnoremap <leader>w      : tabclose<CR>
nnoremap <leader>T      : tabe term://.//zsh<CR>
nnoremap <leader>vs     : vs term://.//zsh<CR>
nnoremap <leader>sp     : sp term://.//zsh<CR>

nnoremap <Space>q       : q<CR>
nnoremap <Space>w       : w<CR>
nnoremap <Space>term    : term<CR>
nnoremap <Space>vs      : vs<CR>
nnoremap <Space>sp      : sp<CR>

nnoremap <Space>=       : vertical resize +10<CR>
nnoremap <Space>-       : vertical resize -10<CR>

nnoremap fb             : Buffers<cr>
nnoremap ff             : FZF<CR>
nnoremap fg             : GFiles<CR>
nnoremap fw             : Windows<CR>

nnoremap <leader>nt     : NERDTreeToggle<CR>
nnoremap <leader>ctags  : !ctags -R && echo "Create tags OK..."<CR>
nnoremap <leader>al     : call AddDashLine()<CR>
nnoremap <leader>ds     : call StripTrailingWhitespace()<CR>

vmap <Enter> <Plug>(EasyAlign)

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
let g:airline_theme='onedark'

" YouCompleteMe
set completeopt-=preview " diable preview window
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf    = 0 " diable confirmation of opening extra_conf file
let g:ycm_show_diagnostics_ui   = 0 " disable

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

" ale
let g:ale_fixers = {
\   'C++': ['clang'],
\}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'

" fzf
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
