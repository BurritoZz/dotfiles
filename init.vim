set nocompatible
filetype off

call plug#begin()

Plug 'vim-scripts/indentpython.vim'
Plug 'Raimondi/delimitMate'
Plug 'tmhedberg/SimpylFold'
Plug 'bitc/vim-bad-whitespace'
Plug 'tfnico/vim-gradle'
Plug 'dylanaraps/wal'
Plug 'shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'ervandew/supertab'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'zchee/deoplete-jedi'
Plug 'neomake/neomake'
Plug 'eagletmt/neco-ghc'
Plug 'mxw/vim-prolog'
Plug 'urso/haskell_syntax.vim'

call plug#end()

command! MakeTags !ctags -R .

let g:netrw_banner = 0          " Disable banner
let g:netrw_browse_split = 4    " Open in prior window
let g:netrw_altv = 1            " open splits to the right
let g:netrw_liststyle = 3       " tree view
let g:netrw_list_hide = netrw_gitignore#Hide()
let g:netrw_list_hide .= ',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize = 10

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:deoplete#enable_at_startup = 1

let g:haskellmode_completion_ghc = 0
autocmd Filetype haskell setlocal omnifunc=necoghc#omnifunc
"autocmd bufreadpost *.hs set noexpandtab | retab! 4
autocmd bufreadpre *.hs set expandtab | retab! 4
"autocmd bufwritepost *.hs set noexpandtab | retab! 4
autocmd! bufwritepost * Neomake

let g:UltiSnipsExpandTrigger = "<C-h>"

" Enable folding "
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar "
nnoremap <space> za

set tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab fileformat=unix autoindent

au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix

"Set vertical lines in tabs and convert indent to tabs
set list listchars=tab:❘-,trail:·,nbsp:_,extends:»,precedes:«,nbsp:×
"autocmd! bufreadpost * set noexpandtab | retab! 4
"autocmd! bufwritepre * set expandtab | retab! 4
"autocmd! bufwritepost * set noexpandtab | retab! 4

set encoding=utf-8

" Map F1 to no op "
nmap <F1> <nop>

colorscheme wal
let python_highlight_all=1
syntax on
set nu
