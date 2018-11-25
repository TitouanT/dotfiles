" VIM Configuration - Titouan Teyssier
" my vim configuration
" ./configure \
"	--with-features=huge \
"	--enable-rubyinterp \
"	--enable-pythoninterp \
"	--enable-python3interp

let mapleader = ","

set nocompatible

" plugins {{{
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" git repos
Plugin 'tpope/vim-fugitive'

" file explorer
Plugin 'sjbach/lusty'

" syntax
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-scripts/clips.vim'

" prolog
Plugin 'mxw/vim-prolog'

" completition
Plugin 'Valloric/YouCompleteMe'
" note to myself: here is how I installed YCM
"git submodule update  --init --recursive
"python install.py --clang-completer --go-completer --java-completer

" theme
Plugin 'ajmwagar/vim-deus'

" animated scroll
"Plugin 'joeytwiddle/sexy_scroller.vim'

call vundle#end()
" }}}

set t_Co=256
colorscheme deus

" splits 101 {{{
set splitbelow
set splitright
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
" }}}


" Affichage
set title

"set relativenumber
set number
set wrap

nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

"set scrolloff=3

" Recherche {{{
set ignorecase
set smartcase

" most of the time I want to do smth on the word I am currently on
nnoremap * *N
set incsearch
set hlsearch
" }}}

" Beep
set novisualbell
set noerrorbells

" active le comportement 'habituel' de la touche retour en arriere
set backspace=indent,eol,start

" Cache les fichiers lors de l'ouverture d'autres fichiers
set hidden

" Active la coloration syntaxique
syntax on
au FileType perl set filetype=prolog

" Active les comportements specifiques aux types de fichiers comme la syntaxe et l'indentation
filetype on
filetype plugin on
filetype indent on

" theme solarized
"set background=dark
"set termguicolors
"colorscheme solarized

" settings for hidden chars
set listchars=tab:>\ ,trail:▓

" show hidden chars
set list

set mouse=a


" Remap de la touche echap pour revenir en mode normal
inoremap jk <Esc>

" Acces plus rapide au registre:
inoremap <leader>r <C-r>

" Move one line up and one line down
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==

" quick edit and reload of vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Instant Hide mode
nnoremap <leader>w myggg?G`y
inoremap <leader>w <esc>myggg?G`ya

" Highlight from search are no longer a problem whith that map
nnoremap <Space> :noh<cr>

" signature, email
iabbrev ssig Titouan Teyssier<cr>titouan dot teyssier at gmail dot com<cr>
iabbrev @@ titouan dot teyssier at gmail dot com

" Make vim use the system clipboard as primary register for copy, cut and
" paste
set number
set clipboard=unnamedplus


set tabstop=4
set shiftwidth=4

" status line {{{
set laststatus=2 " always show the status line
set statusline=%<%f%y%h%m%r%=%3c,%3l/%L
" }}}

" vimscript language settings {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup end
" }}}

" resize window with arrow keys {{{
" modifying a window's width change the position of the right separator.
" modifying a window's height change the position of the bottom separator.

" move the left separator right(+) and left(-)
function LeftSeparator(deltaW)
	if !TestNeighbor("h")
		return
	endif
	let l:currentWindow = winnr()
	wincmd h " going to the left window
	call RightSeparator(a:deltaW)
	execute l:currentWindow . "wincmd w"
endfunction

" move the right separator right(+) and left(-)
function RightSeparator(deltaW)
	if !TestNeighbor("l")
		return
	endif
	if a:deltaW > 0
		execute "vertical resize +" . a:deltaW
	else
		execute "vertical resize " . a:deltaW
	endif
endfunction


" move the bottom separator of the window up(+) and down(-)
function BottomSeparator(deltaW)
	if !TestNeighbor("j")
		return
	endif
	if a:deltaW > 0
		execute "resize -" . a:deltaW
	else
		execute "resize +" . -a:deltaW
	endif
endfunction

" move the top separator of the window up and down
function TopSeparator(deltaW)
	if !TestNeighbor("k")
		return
	endif
	let l:currentWindow = winnr()
	wincmd k
	call BottomSeparator(a:deltaW)
	execute l:currentWindow . "wincmd w"
endfunction

function TestNeighbor(direction)
	let l:currentWindow = winnr()
	execute "wincmd " . a:direction
	let l:neighbor = winnr()
	execute l:currentWindow . "wincmd w"
	if l:neighbor != l:currentWindow
		return 1
	endif
endfunction


nnoremap <C-Up> :call TopSeparator(5)<cr>
nnoremap <C-Down> :call TopSeparator(-5)<cr>
nnoremap <C-Left> :call LeftSeparator(-10)<cr>
nnoremap <C-Right> :call LeftSeparator(10)<cr>

nnoremap <Up> :call BottomSeparator(5)<cr>
nnoremap <Down> :call BottomSeparator(-5)<cr>
nnoremap <Left> :call RightSeparator(-10)<cr>
nnoremap <Right> :call RightSeparator(10)<cr>

"inoremap <C-Up> <ESC>:call TopSeparator(5)<cr>a
"inoremap <C-Down> <ESC>:call TopSeparator(-5)<cr>a
"inoremap <C-Left> <ESC>:call LeftSeparator(-10)<cr>a
"inoremap <C-Right> <ESC>:call LeftSeparator(10)<cr>a

"inoremap <Up> <ESC>:call BottomSeparator(5)<cr>a
"inoremap <Down> <ESC>:call BottomSeparator(-5)<cr>a
"inoremap <Left> <ESC>:call RightSeparator(-10)<cr>a
"inoremap <Right> <ESC>:call RightSeparator(10)<cr>a
" }}}
