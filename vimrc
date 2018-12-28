"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim and neovim configuration file
" Dyinnz 2017/10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
call plug#begin('~/.vim/plugged')

" Color theme
Plug 'joshdick/onedark.vim'
" Code highlight
Plug 'sheerun/vim-polyglot'

" UI
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'mhinz/vim-startify'

" Move
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

" tags
" Plug 'ludovicchabant/vim-gutentags'

" Cpp
Plug 'vim-scripts/a.vim'
Plug '~/.vim/YouCompleteMe'

" Python
Plug 'klen/python-mode', { 'for': 'python' }

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme
set background=dark " require
colorscheme onedark

set synmaxcol=200
set lazyredraw
set scrolloff=3 " Minimum lines to keep above and below cursor

" shell and terminal
set shell=/bin/bash
autocmd BufWinEnter,WinEnter term://* startinsert
set splitbelow
set splitright

" indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

set tags=./.tags;,.tags;,tags

set completeopt=menu 

set nowrap

set smartcase
set ignorecase

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mapping

map f                   <Plug>Sneak_s
map F                   <Plug>Sneak_S

tnoremap <Esc>          <C-\><C-N>
tnoremap <C-H>          <C-\><C-N><C-W>h
tnoremap <C-J>          <C-\><C-N><C-W>j
tnoremap <C-K>          <C-\><C-N><C-W>k
tnoremap <C-L>          <C-\><C-N><C-W>l

map   <C-A>             ^
imap  <C-A>             <ESC>I
map   <C-E>             $
imap  <C-E>             <ESC>A

nnoremap <C-m>          : Buffers<CR>
nnoremap <C-p>          : FZF<CR>
nnoremap <S-Tab>        <C-PageUp>
nnoremap <Tab>          <C-PageDown>

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

"
nnoremap <M-]>          <C-W>}

nnoremap <Space>a       : A<CR>

" Tab
nnoremap <Space>tt      : tabnew<CR>
nnoremap <Space>tc      : tabclose<CR>
nnoremap <Space>to      : tabonly<CR>
nnoremap <Space>TT      : tabe term://.//zsh<CR>
nnoremap <Space>tn      : tabnext<CR>
nnoremap <Space>tp      : tabprev<CR>
nnoremap <Space>th      : tabmove -<CR>
nnoremap <Space>tl      : tabmove +<CR>

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

nnoremap <leader>nt     : NERDTreeToggle<CR>
nnoremap <leader>al     : call AddDashLine()<CR>
nnoremap <leader>ds     : call StripTrailingWhitespace()<CR>
nnoremap <leader>ct     : !ctags -R -f ".tags" .<CR>
nnoremap <leader>fix    : ALEFix <CR>

nmap <Space>fk <Plug>(ale_previous_wrap)
nmap <Space>fj <Plug>(ale_next_wrap)

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
let g:ycm_global_ycm_extra_conf      = '~/.vim/ycm_extra_conf.py'
let g:ycm_complete_in_strings        = 1
let g:ycm_confirm_extra_conf         = 0 " diable confirmation of opening extra_conf file
let g:ycm_show_diagnostics_ui        = 0 " disable
let g:ycm_add_preview_to_completeopt = 0


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
            \ 'cpp': ['clang'],
            \ 'python': ['flake8'],
            \}
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['isort', 'yapf'],
            \}
let g:ale_cpp_clang_options = '-std=c++17 -Wall -Wextra'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1


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

" iron repl
let g:iron_map_defaults=0
let g:iron_repl_open_cmd = 'vs'

" ctags
let s:vim_tags = expand('~/.cache/tags')
if !isdirectory(s:vim_tags)
  silent! call mkdir(s:vim_tags, 'p')
endif

" let g:gutentags_project_root = ['.git', '.root']
" let g:gutentags_ctags_tagfile = '.tags'
" let g:gutentags_cache_dir = s:vim_tags
" let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

set rtp+=/usr/local/opt/fzf
