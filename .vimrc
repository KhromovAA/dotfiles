" PLUGINS ---------------------------------------------------------{{{
call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'
Plug 'preservim/nerdcommenter'
Plug 'sheerun/vim-polyglot'
call plug#end()
" }}}


"SETTINGS ---------------------------------------------------------{{{
filetype plugin on
set formatoptions=

set cursorline
set splitbelow
set splitright


colorscheme onedark
set background=dark

hi Normal guibg=NONE ctermbg=NONE
" }}}


" MAPPINGS ------------------------------------------------------- {{{

inoremap jk <esc>

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
	    autocmd!
	        autocmd FileType vim setlocal foldmethod=marker
	augroup END

	" More Vimscripts code goes here.

" }}}


" STATUS LINE ---------------------------------------------------- {{{

" Status bar code goes here.

" }}}

