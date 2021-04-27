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
	nnoremap <C-H> <C-W><C-H>

" Jump 3 times more than before
	noremap <C-e> 3<C-e>
	noremap <C-y> 3<C-y>

" Open tagmenu with F8
nmap <F8> :TagbarToggle<CR>

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

" Gruvbox colorsheme configuration
	let g:gruvbox_italic = '0'
	let g:gruvbox_improved_strings = '1'
	let g:gruvbox_improved_warnings = '1'
	let g:gruvbox_invert_tabline = '1'

	set bg=dark
	colorscheme gruvbox

" Vundle
	filetype off                  " required

	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

	Plugin 'VundleVim/Vundle.vim'

	Plugin 'scrooloose/nerdtree'
	Plugin 'tpope/vim-fugitive'
	Plugin 'tpope/vim-surround'
	Plugin 'benmills/vimux'
	Plugin 'majutsushi/tagbar'
	Plugin 'itchyny/lightline.vim'
	Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
	Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
	Plugin 'vim-syntastic/syntastic'

	" Python
	Plugin 'tmhedberg/SimpylFold'
	Plugin 'vim-scripts/indentpython.vim'
	" Bundle 'Valloric/YouCompleteMe'
	Plugin 'nvie/vim-flake8'
	Plugin 'davidhalter/jedi-vim'


	call vundle#end()            " required
	filetype plugin indent on    " required

" Syntastic
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0 

" Lightline configuration
	set noshowmode
	set laststatus=2	
	if !has('gui_running')
		set t_Co=256
	endif

" SimplyFold
	let g:SimpylFold_docstring_preview = 1

" YouCompleteMe
	let g:ycm_autoclose_preview_window_after_completion=1
	map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
