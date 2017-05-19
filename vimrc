scriptencoding utf-8

" Settings
"---------
"
filetype plugin indent on
syntax on

set ai                      " Auto indent
set ruler                   " Show the cursor position; always.
set nomodeline              " modeline might compromise the system, I don't need it anyways.
set nocompatible            " Vi is nice, but I preffer VIM.
set showcmd                 " Show current (partial) command.
set wildmenu                " command autocomplete menu.
set hidden                  " Keep the buffer's history.

set visualbell              " use visual bell instead of beeping
set ttyfast                 " indicates a fast terminal connection
set autoread                " Reload files changed outside vim

set bs=2                    " backspacing over everything in insertmode.
set viminfo='20,\"500       " keep a .viminfo file.
set history=91              " keep 91 lines of command history.
set shortmess+=I            " Do no display the default initial text.
set fileformats+=mac        " Mac eol
set omnifunc=syntaxcomplete#Complete

" log and backup files, they are supposed to hold information,
" this information, represent something from the past, usually
" one would not want to modify them.
autocmd BufRead,BufNewFile *.log  set nomodifiable
autocmd BufRead,BufNewFile *.~    set nomodifiable
autocmd BufRead,BufNewFile *.bak  set nomodifiable
autocmd BufRead,BufNewFile *.back set nomodifiable

" Interpret Makefile.inc as a Makefile
au BufRead,BufNewFile Makefile.inc setfiletype make
au BufRead,BufNewFile makefile.inc setfiletype make

" Change indentation for Haskell, use space instead of tabs :(
autocmd Filetype haskell setlocal tabstop=8 shiftwidth=8 expandtab

if &t_Co < 255
	" Force 255 colors, I don't care!.
	set t_Co=255
endif

" Whe displaying line numbers, don't use a annoying wide number column.
if v:version >= 700
	set numberwidth=3
endif

if has("gui_running")
	imap <S-CR> <Esc>
	nmap <S-CR> <Esc>
	colorscheme basic-dark
endif


" Status
set statusline=2
set laststatus=2    " Show bottom status.

" Space
set nowrap          " Do no wrap lines.
set noexpandtab     " Do not use space for indentation!

" Search
set hlsearch        " Highlight search.
set incsearch       " Incremental search.
set ignorecase      " case insensitive search.
set smartcase       " case sensitive search if a capitar letter is present.

"MAPS
nmap <CR> o<ESC>k
nmap <SPACE> O<ESC>j

"        ------- cut here -----



"
" Plugins
" -  -  -  -
" Plugins configuration area.
"

" Pathogen
" --------
" URL: https://github.com/tpope/vim-pathogen
"
execute pathogen#infect()
Helptags                    " Load plugins documentation.


" CtrlP
" ------

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .keep
      \ --ignore node_modules
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'


" vim-airline
" -----------
" URL: https://github.com/bling/vim-airline
"

let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled  = 1      " Enable the list of buffers.
let g:airline#extensions#tabline#fnamemod = ':t'   " Show just the filename.

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_left_sep           = '»'
let g:airline_left_sep           = '▶'
let g:airline_right_sep          = '«'
let g:airline_right_sep          = '◀'
let g:airline_symbols.linenr     = '␊'
let g:airline_symbols.linenr     = '␤'
let g:airline_symbols.linenr     = '¶'
let g:airline_symbols.branch     = '⎇'
let g:airline_symbols.paste      = 'ρ'
let g:airline_symbols.paste      = 'Þ'
let g:airline_symbols.paste      = '∥'
let g:airline_symbols.whitespace = 'Ξ'

