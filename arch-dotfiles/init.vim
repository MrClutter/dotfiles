"naprawic config dla pythona

set nocompatible
set ruler
set number
set relativenumber
set smartcase

set wildmenu

set path+=**
set clipboard=unnamed

set encoding=utf-8

let mapleader=" "

let python_highlight_all=1
syntax on

set mouse=a

" Display white characters
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:< 
noremap <F5> :set list!<CR>

" Font configuration
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" If editing Python bind F9 to exec
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Split configuration 
	set splitbelow
	set splitright
	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	noremap <C-H> <C-W><C-H>

" Jump 3 times more than before
	noremap <C-e> 3<C-e>
	noremap <C-y> 3<C-y>

" Enable floding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <leader>i za

" PEP 8 indentation for Python
au BufNewFile, BufRead *.py
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	"set textwidth=79
	set expandtab
	set autoindent
	set fileformat=unix

" Bad spaces
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Python with virtualenv support
"!python3 << EOF 
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    execfile(activate_this, dict(__file__=activate_this))
"EOF
