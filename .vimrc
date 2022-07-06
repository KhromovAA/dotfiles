" PLUGINS ---------------------------------------------------------{{{
call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'preservim/nerdcommenter'
call plug#end()
" }}}


" CONFIG ---------------------------------------------------------{{{
filetype plugin on

set cursorline
set splitbelow
set splitright

colorscheme onedark
set background=dark
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

