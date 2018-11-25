" VIM Configuration - Titouan Teyssier
" my vim configuration
" ./configure \
"	--with-features=huge \
"	--enable-rubyinterp \
"	--enable-pythoninterp \
"	--enable-python3interp

set nocompatible

" Plugins {{{
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" git repos
" TODO: learn to use it
"Plugin 'tpope/vim-fugitive'

" file explorer
" TODO: learn to use it
"Plugin 'sjbach/lusty'

" syntax
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-scripts/clips.vim'
Plugin 'mxw/vim-prolog'

" completition
Plugin 'Valloric/YouCompleteMe'
" note to myself: here is how I installed YCM
"git submodule update  --init --recursive
"python install.py --clang-completer --go-completer --java-completer

" theme
" Plugin 'ajmwagar/vim-deus'
Plugin 'fatih/molokai'

Plugin 'itchyny/lightline.vim'

" animated scroll
"Plugin 'joeytwiddle/sexy_scroller.vim'

Plugin 'tpope/vim-commentary'

call vundle#end()
" }}}

" Color {{{
syntax enable
set t_Co=256
set background=dark
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
"}}}

" Splits 101 {{{
set splitbelow
set splitright
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
" }}}

" Recherche {{{
set ignorecase
set smartcase

" most of the time I want to do smth on the word I am currently on
nnoremap * *N
nnoremap n nzz
nnoremap N Nzz
set incsearch
set hlsearch
" }}}

" Settings {{{
" Active les comportements specifiques aux types de fichiers comme la syntaxe et l'indentation
filetype on
filetype plugin on
filetype indent on
" active le comportement 'habituel' de la touche retour en arriere
set backspace=indent,eol,start
" settings for hidden chars
set listchars=tab:>\ ,trail:▓
" show hidden chars
set list
set mouse=a
set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4
set hidden
set noerrorbells
set novisualbell
set number
set wrap
" }}}

" Mappings {{{
let mapleader = ","
" Remap de la touche echap pour revenir en mode normal
inoremap jk <Esc>
vnoremap jk <Esc>

" Acces plus rapide au registre:
inoremap <leader>r <C-r>

" Move one line up and one line down
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==

" quick edit and reload of vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr><cr>

" Instant Hide mode
nnoremap <leader>w myggg?G`y

" Highlight from search are no longer a problem whith that map
nnoremap <leader><Space> :noh<cr>
" center on space
nnoremap <Space> zz

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" make navigation easier
nnoremap j gj
nnoremap k gk

nnoremap <leader>v :only<cr>

nnoremap <leader>zz :let &scrolloff=999-&scrolloff<CR>
nnoremap <cr> o<esc>k
nnoremap <C-cr> O<esc>j


" }}}

" Status line {{{
set laststatus=2 " always show the status line
set noshowmode
set showcmd
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
function! LeftSeparator(deltaW)
	if !TestNeighbor("h")
		return
	endif
	let l:currentWindow = winnr()
	wincmd h " going to the left window
	call RightSeparator(a:deltaW)
	execute l:currentWindow . "wincmd w"
endfunction

" move the right separator right(+) and left(-)
function! RightSeparator(deltaW)
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
function! BottomSeparator(deltaW)
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
function! TopSeparator(deltaW)
	if !TestNeighbor("k")
		return
	endif
	let l:currentWindow = winnr()
	wincmd k
	call BottomSeparator(a:deltaW)
	execute l:currentWindow . "wincmd w"
endfunction

function! TestNeighbor(direction)
	let l:currentWindow = winnr()
	execute "wincmd " . a:direction
	let l:neighbor = winnr()
	execute l:currentWindow . "wincmd w"
	if l:neighbor != l:currentWindow
		return 1
	endif
endfunction


nnoremap <silent> <C-Up> :call TopSeparator(2)<cr>
nnoremap <silent> <C-Down> :call TopSeparator(-2)<cr>
nnoremap <silent> <C-Left> :call LeftSeparator(-2)<cr>
nnoremap <silent> <C-Right> :call LeftSeparator(2)<cr>

nnoremap <silent> <Up> :call BottomSeparator(2)<cr>
nnoremap <silent> <Down> :call BottomSeparator(-2)<cr>
nnoremap <silent> <Left> :call RightSeparator(-2)<cr>
nnoremap <silent> <Right> :call RightSeparator(2)<cr>

"inoremap <C-Up> <ESC>:call TopSeparator(5)<cr>a
"inoremap <C-Down> <ESC>:call TopSeparator(-5)<cr>a
"inoremap <C-Left> <ESC>:call LeftSeparator(-10)<cr>a
"inoremap <C-Right> <ESC>:call LeftSeparator(10)<cr>a

"inoremap <Up> <ESC>:call BottomSeparator(5)<cr>a
"inoremap <Down> <ESC>:call BottomSeparator(-5)<cr>a
"inoremap <Left> <ESC>:call RightSeparator(-10)<cr>a
"inoremap <Right> <ESC>:call RightSeparator(10)<cr>a
" }}}

" Other Settings
au FileType perl set filetype=prolog

" signature, email
iabbrev ssig Titouan Teyssier<cr>titouan dot teyssier at gmail dot com<cr>
iabbrev @@ titouan dot teyssier at gmail dot com

