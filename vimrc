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

set ttyfast                 " indicates a fast terminal connection
set autoread                " Reload files changed outside vim

set tags+=~/.vim/systags    " Load pre-parsed system tags
set sessionoptions+=unix,slash  "write session files in a MS-unix compatible way.

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

" Don't interprent *.md files as module-2. I don't know modula-2 and I don't
" think I'll be using modula-2 in the near future.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Interpret Makefile.inc as a Makefile
au BufRead,BufNewFile Makefile.inc setfiletype make
au BufRead,BufNewFile makefile.inc setfiletype make
au BufRead,BufNewFile Podfile setfiletype ruby

" Change indentation for Haskell, use space instead of tabs :(
autocmd Filetype haskell setlocal tabstop=8 shiftwidth=8 expandtab

" Change indentation for vue, use space instead of tabs
autocmd Filetype vue setlocal tabstop=2 shiftwidth=2 expandtab

if &t_Co < 255
	" Force 255 colors, I don't care!
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
nnoremap gp `[v`]

" Insert line below current line without leaving the current position
nnoremap <CR> m`o<ESC>``

" Insert line above current line without leaving the current position
nnoremap <SPACE> m`O<ESC>``

" Toggle paste mode
noremap zp :set paste!<CR>

" non portable
nnoremap ÷ <ESC>
inoremap ÷ <ESC>
vnoremap ÷ <ESC>

"        ------- cut here -----



"
" Plugins
" -  -  -  -
" Plugins configuration area.
"

"
" Reading man pages
"
runtime! ftplugin/man.vim
let g:ft_man_open_mode = 'vert'  " Open man page on a vertical split

" Pathogen
" --------
" URL: https://github.com/tpope/vim-pathogen
"
execute pathogen#infect()
Helptags                    " Load plugins documentation.

"
" Ack.vim
" ----
if executable('ag')
	let g:ackprg = 'ag --ignore .git
			\ --ignore "**/*.pyc"
	                \ --ignore node_modules
	                \ --ignore *.o
	                \ --ignore *.swp --vimgrep'
endif

" CtrlP
" ------

if executable('ag')
	let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
				\ --ignore .git
				\ --ignore .svn
				\ --ignore .hg
				\ --ignore .keep
				\ --ignore node_modules
				\ --ignore .DS_Store
				\ --ignore "**/*.pyc"
				\ --ignore *.o
				\ --ignore *.swp
				\ -g ""'
endif

" vim-airline
" -----------
" URL: https://github.com/bling/vim-airline
"

let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled  = 1      " Enable the list of buffers.
let g:airline#extensions#tabline#fnamemod = ':t'   " Show just the filename.
let g:airline#extensions#tabline#buffer_nr_show = 1

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

set exrc                    "Execute per-project configuration file (local .vimrc)
set secure                  "Protect against evil .vimrc
