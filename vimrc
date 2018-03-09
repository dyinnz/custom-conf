"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim and neovim configuration file
" Dyinnz 2017/10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
call plug#begin('~/.vim/plugged')

" Color & Highlight
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'

" UI
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'

" Move
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'justinmk/vim-sneak'

" Edit
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'

" Search
" Plug 'ctrlpvim/ctrlp.vim'
if has('macunix')
  Plug '/usr/local/opt/fzf'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif
Plug 'junegunn/fzf.vim'

" Lint
Plug 'w0rp/ale'

" REPL
Plug 'hkupty/iron.nvim'

" Cpp
Plug 'vim-scripts/a.vim', { 'for': 'cpp' }
Plug '~/.vim/YouCompleteMe'

" Python
Plug 'klen/python-mode', { 'for': 'python' }

" Plug 'mattn/emmet-vim'
"
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme
set background=dark " require
colorscheme onedark

set synmaxcol=200
set lazyredraw
set scrolloff=3 " Minimum lines to keep above and below cursor

" shell and terminal
set shell=/bin/zsh
autocmd BufWinEnter,WinEnter term://* startinsert
set splitbelow
set splitright

" indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

if has('nvim')
  autocmd TermClose * bd!
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
  set backspace=indent,eol,start
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mapping

map f                   <Plug>Sneak_s
map F                   <Plug>Sneak_S

tnoremap <Esc>          <C-\><C-N>
tnoremap <C-H>          <C-\><C-N><C-W>h
tnoremap <C-J>          <C-\><C-N><C-W>j
tnoremap <C-K>          <C-\><C-N><C-W>k
tnoremap <C-L>          <C-\><C-N><C-W>l
tnoremap <C-Z>          <C-\><C-N><C-PageUp>
tnoremap <C-X>          <C-\><C-N><C-PageDown>

map   <C-A>             ^
imap  <C-A>             <ESC>I
map   <C-E>             $
imap  <C-E>             <ESC>A

nnoremap <C-Q>          : Buffers<CR>
nnoremap <C-P>          : FZF<CR>
nnoremap <C-S>          : w<CR>
nnoremap <C-Z>          <C-PageUp>
nnoremap <C-X>          <C-PageDown>

nnoremap <Space>s       : w<CR>
nnoremap <Space>q       : q<CR>
nnoremap <Space>Q       : q!<CR>

nnoremap <Space>=       : vertical resize +10<CR>
nnoremap <Space>-       : vertical resize -10<CR>

" Window
nnoremap <Space>wv      : vs<CR>
nnoremap <Space>ws      : sp<CR>
nnoremap <Space>wc      : close<CR>
nnoremap <Space>wo      : only<CR>
nnoremap <Space>WV      : vs term://.//zsh<CR>
nnoremap <Space>WS      : sp term://.//zsh<CR>

" Tab
nnoremap <Space>tt      : tabnew<CR>
nnoremap <Space>tc      : tabclose<CR>
nnoremap <Space>to      : tabonly<CR>
nnoremap <Space>TT      : tabe term://.//zsh<CR>
nnoremap <Space>tn      : tabnext<CR>
nnoremap <Space>tp      : tabprev<CR>
nnoremap <Space>th      : tabmove -<CR>
nnoremap <Space>tl      : tabmove +<CR>

" Buffer
nnoremap <Space>bs      : w<CR>
nnoremap <Space>bd      : bd<CR>
nnoremap <Space>bn      : bn<CR>
nnoremap <Space>bp      : bp<CR>

" FZF
nnoremap <Space>ff      : Files<CR>
nnoremap <Space>fg      : GFiles<CR>
nnoremap <Space>fs      : Ag! 
nnoremap <Space>fw      : Ag! <C-R><C-W><CR>
nnoremap <Space>fb      : Buffers<CR>

nmap <Space>R           <Plug>(iron-repeat-cmd)
nmap <Space>r           V<Plug>(iron-send-motion)
vmap <Space>r           <Plug>(iron-send-motion)

nnoremap <leader>lf     : 0,$!yapf<CR>

nnoremap <leader>nt     : NERDTreeToggle<CR>
nnoremap <leader>ctags  : !ctags -R && echo "Create tags OK..."<CR>
nnoremap <leader>al     : call AddDashLine()<CR>
nnoremap <leader>ds     : call StripTrailingWhitespace()<CR>

vmap <leader>a          <Plug>(EasyAlign)

cnoremap <expr> %%      getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

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


" Python
let g:ycm_python_binary_path     = 'python3'
let g:polyglot_disabled          = ['python'] " conficts with pymode
let g:pymode_python              = 'python3'
let g:pymode_options             = 0
let g:pymode_lint                = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_folding             = 0
let g:pymode_rope                = 0
let g:pymode_rope_completion     = 0
let g:pymode_rope_regenerate_on_write = 0


" ale
let g:ale_linters = {
      \   'python': ['flake8'],
      \   'C++': ['clang-format'],
      \}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'


" fzf
autocmd FileType fzf tnoremap <buffer> <Esc> <C-C>
autocmd FileType fzf tnoremap <buffer> <C-J> <C-N>
autocmd FileType fzf tnoremap <buffer> <C-K> <C-P>

let $FZF_DEFAULT_COMMAND = 'ag --follow --nocolor --nogroup -g ""'
let $FZF_DEFAULT_OPTS = '--bind=ctrl-d:page-down,ctrl-u:page-up'

command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:50%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)


" ctrlp
let g:ctrlp_user_command = 'ag %s --follow --nocolor --nogroup -g ""'

let g:iron_map_defaults=0
let g:iron_repl_open_cmd = 'vs'
