"{{{ Vundle

" be iMproved, required
set nocompatible
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Plugins
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'      " let Vundle manage Vundle, required

" UI / Highlight
Plugin 'airblade/vim-gitgutter'
" Plugin 'scrooloose/syntastic'
Plugin 'yggdroot/indentline'
" Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'flazz/vim-colorschemes'
" Plugin 'spf13/vim-colors'
" Plugin 'powerline/fonts'

" Interface
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'

" Motion
Plugin 'easymotion/vim-easymotion'
Plugin 'rhysd/conflict-marker.vim'

" Integration
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-tmux-navigator'

" Edition
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'

" Search
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'mileszs/ack.vim'
" Plugin 'rking/ag.vim'
Plugin 'osyo-manga/vim-over'

" Pragramming Language

" cpp
Plugin 'vim-scripts/a.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'jeaye/color_coded'

" clojure
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'

" python
" Plugin 'klen/python-mode'

" rust
Plugin 'rust-lang/rust.vim'

call vundle#end()

filetype plugin indent on    " required

"}}}

"{{{ Normal Settings

" Mics
set encoding=utf-8
set shell=/bin/bash
set autowrite
set foldmethod=marker
set conceallevel=2
set hidden
set backspace=indent,eol,start

" Format
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Highlight
syntax on
set background=dark
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set cursorline                  " Highlight current line

" UI
set number
set foldenable
set ruler
set wildmenu
set showcmd
set scrolloff=3                 " Minimum lines to keep above and below cursor

" Search
set smartcase
set ignorecase
set incsearch
set hlsearch

"}}}

"{{{ Key Mappings

let mapleader='\'

noremap <F3> :!ctags -R & echo "create tags OK"<CR>

noremap <C-S> :w<CR>

noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l
noremap <C-H> <C-W>h

noremap <leader><TAB> :bn<CR>
noremap <leader><S-TAB> :bp<CR>

noremap <leader>s :OverCommandLine<CR>
noremap <leader>tag :TagbarToggle <CR>
" noremap <leader>cstrip :call StripTrailingWhitespace()<CR>

" noremap <leader>g :YcmCompleter GoTo <CR>
" noremap <leader>d :YcmCompleter GoToDefinition <CR>
" noremap <leader>c :YcmCompleter GoToDeclaration <CR>
" noremap <leader>i :YcmCompleter GoToImprecise <CR>
" noremap <leader>p :YcmCompleter GetParent <CR>
" noremap <leader>t :YcmCompleter GetType <CR>

" noremap qh :call AddFlieHead()<CR>
" noremap qc :call AddDashComment()<CR>
" noremap ql :call AddDashLine()<CR>

"}}}

"{{{ Customized Functions

function AddFlieHead()
  call append(0, "/*******************************************************************************")
  call append(1, " * Author: Dyinnz.HUST.UniqueStudio")
  call append(2, " * Email:  ml_143@sina.com")
  call append(3, " * Github: https://github.com/dyinnz")
  call append(4, " * Date:   ".strftime("%Y-%m-%d"))
  call append(5, " ******************************************************************************/")
endfunction

function AddStarComment()
  call append(line(".")+0, "/***************************************************************************//**")
  call append(line(".")+1, " *  ")
  call append(line(".")+2, " ******************************************************************************/")
  call cursor(line(".")+2, 5)
  call feedkeys("i")
endfunction

function AddStarLine()
  call append(line(".")+0, "/**************************************************************************/")
endfunction

function AddDashComment()
  call append(line(".")+0, "/*----------------------------------------------------------------------------*")
  call append(line(".")+1, " *  ")
  call append(line(".")+2, " *----------------------------------------------------------------------------*/")
  call cursor(line(".")+2, 5)
  call feedkeys("i")
endfunction

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

"{{{ vim-gitgutter

highlight clear VertSplit
highlight clear SignColumn
highlight clear LineNr
highlight clear SpecialKey

"}}}

"{{{ indentline

let g:indentLine_conceallevel=2

"}}}

"{{{ " vim-indent-guides

" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1
" let g:indent_guides_enable_on_vim_startup = 1

"}}}

"{{{ rainbow_parentheses.vim

autocmd VimEnter * RainbowParenthesesToggle " Toggle it on
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
let g:rbpt_colorpairs = [
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ]

"}}}

"{{{ vim-colors-solarized

let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
color solarized             " Load a colorscheme

"}}}

"{{{ airline

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='simple'

"}}}

"{{{ tagbar

let g:tagbar_left=1
let g:tagbar_width=32
"let g:tagbar_compact=1
"let g:tagbar_expand=2

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
let g:ycm_global_ycm_extra_conf = '/home/dyinnz/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"}}}

"{{{ clojure

autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry
autocmd Syntax clojure RainbowParenthesesLoadBraces " {}
autocmd Syntax * RainbowParenthesesLoadRound " ()
autocmd Syntax clojure RainbowParenthesesLoadSquare " []

"}}}

"{{{ " python-mode

" setlocal textwidth=80
" let g:pymode_warnings = 0
" let g:pymode_options_max_line_length = 80
" let g:pymode_options_colorcolumn = 0
" let g:pymode_folding = 0
" let g:pymod_lint = 0
" let g:pymod_lint_on_write = 1
" let g:pymode_lint_unmodified = 0
" let g:pymode_lint_on_fly = 0
" let g:pymode_lint_message = 1
" let g:pymode_lint_cwindow = 0
" let g:pymode_syntax_space_errors = 0
" let g:pymode_syntax_indent_errors = 0
" let g:pymode_lint_signs = 2
" let g:pymode_run = 1
" let g:pymode_run_bind = ',r'
" let g:pymode_rope_completion = 0
" let g:pymode_rope_complete_on_dot = 0

"}}}

"{{{ rust.vim

au BufNewFile,BufRead *.rs set filetype=rust

"}}}

"}}}
