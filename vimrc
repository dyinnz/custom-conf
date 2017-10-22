"{{{ Vundle

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

call vundle#end()

filetype plugin indent on    " required

"}}}

"{{{ vim-colors-solarized :  must be triggerred as early as possible

let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
color solarized             " Load a colorscheme

"}}}

"{{{ Normal Settings

" Vim
syntax on

set encoding=utf-8
set shell=/bin/bash
set foldmethod=marker
set background=dark
set ttyfast " Speed up
set lazyredraw "Speed up
set showcmd

" About indent
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Color
highlight Folded term=bold cterm=bold
highlight clear VertSplit
highlight clear SignColumn        " link to LineNr
highlight clear LineNr            " Line Number
highlight clear SpecialKey        " for listchars
highlight clear StatusLine
highlight StatusLine ctermfg=33 guifg=Cyan
highlight clear WildMenu
highlight WildMenu ctermfg=136 gui=bold guifg=#60ff60

" UI
set number
set wildmenu
set scrolloff=3 " Minimum lines to keep above and below cursor

" Search
set smartcase
set incsearch
set hlsearch

"}}}

"{{{ Key Mappings

map <TAB>   : bn<CR>
map <S-TAB> : bp<CR>

map <leader>ctags   : !ctags -R && echo "create tags OK"<CR>
map <leader>mstrip  : call StripTrailingWhitespace()<CR>
map <leader>dl      : call AddDashLine()<CR>
map <leader>w       : bd<CR>
map <leader>t       : NERDTreeToggle<CR>
map <leader><space> <Plug>NERDCommenterToggle

"}}}

"{{{ Customized Functions

function AddDashLine()
  call append(line(".")+0, "/*----------------------------------------------------------------------------*/")
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

"}}}

"{{{ Plugin Settings

"{{{ airline
let g:airline#extensions#tabline#enabled = 1
"}}}

"{{{ vim-cpp-enhanced-highlight

let g:cpp_class_scope_highlight=1
let g:cpp_experimental_template_highlight=1

"}}}

"{{{ YouCompleteMe

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

"}}}

"{{{ ctrlp
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v(\.git|(CM|cm)ake\w+|tmp|node_modules|googletest)$',
      \ 'file': '\v(\.o|tags|\.class)$',
      \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
      \ }
"}}}

"{{{ MacOS
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'

"}}}

"}}}
