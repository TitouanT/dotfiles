" ~/.vim/vimrc
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
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'c0r73x/vimdir.vim'
" Plugin 'junegunn/vim-emoji'
" Plugin 'kyuhi/vim-emoji-complete'
"
Plugin 'SirVer/ultisnips'

"jupyter notebook
" Plugin 'szymonmaszke/vimpyter'
" git repos
" TODO: learn to use it
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'shumphrey/fugitive-gitlab.vim'
let g:fugitive_gitlab_domains = ['https://git-lium.univ-lemans.fr']

" file explorer
" TODO: learn to use it
"Plugin 'sjbach/lusty'

" syntax
Plugin 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['haskell']
Plugin 'vim-scripts/clips.vim'
Plugin 'mxw/vim-prolog'
Plugin 'posva/vim-vue'

" completition
Plugin 'Valloric/YouCompleteMe'
" note to myself: here is how I installed YCM
"git submodule update  --init --recursive
"python install.py --clang-completer --go-completer --java-completer

" theme
Plugin 'fatih/molokai'

Plugin 'itchyny/lightline.vim'


Plugin 'tpope/vim-commentary'

Plugin 'TitouanT/vim-serie'

Plugin 'Townk/vim-autoclose'
Plugin 'chrisbra/unicode.vim'

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
" set listchars=tab:>\ ,trail:▓
set listchars=tab:│\ ,trail:▓
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
set relativenumber
set autoindent

" start using z[sehlHL]
set nowrap

set breakindent
set updatetime=100
set timeoutlen=1000 ttimeoutlen=0
set guioptions=
let g:ycm_autoclose_preview_window_after_completion = 1

" standard numbers in insert mode
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" }}}

" Mappings {{{
let mapleader = ","
" Remap de la touche echap pour revenir en mode normal
inoremap jk <Esc>
inoremap kj <Esc>
" vnoremap <leader>q <Esc>
" Acces plus rapide au registre:
inoremap <leader>r <C-r>

nnoremap <silent> <leader>T Yp!!tree-tagger-french 2> /dev/null \| column -t<cr>
" nnoremap <silent> <leader>n :execute "! npm start &"<cr>:redraw!<cr>
nnoremap <silent> <leader>n :vertical terminal <cr> npm start<cr><C-W><C-H>
" Move one line up and one line down
" nnoremap J :m .+1<CR>==
" nnoremap K :m .-2<CR>==

" quick edit of my
" notes
nnoremap <leader>en :e $HOME/.vim/perso/notes.txt<cr>
" series
nnoremap <leader>es :e $HOME/.vim/perso/tracker.serie<cr>
" master internship journal
nnoremap <leader>em :e $HOME/.vim/perso/master_stage.txt<cr>
" vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>:noh<cr>
" i3rc
nnoremap <leader>ei :e $HOME/.config/i3/config<cr>
" zshrc
nnoremap <leader>ez :e $HOME/.zshrc<cr>

" Instant Hide mode
nnoremap <leader>c myggg?G`y

" Save and Quit
nnoremap <leader>w :w<cr>
" maybe ZZ
nnoremap <leader>q :wq<cr>
inoremap <leader>q <esc>:wq<cr>

" Highlight from search are no longer a problem whith that map
nnoremap <silent> <leader><Space> :noh<cr>
" center on space
nnoremap <Space> zz

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" make navigation easier
nnoremap j gj
nnoremap k gk


nnoremap <leader>v :only<cr>
nnoremap <leader>d i<cr><cr><esc>k!! date +\%d/\%m/\%y<CR>k3J
inoremap <leader>d <cr><cr><esc>k!! date +\%d/\%m/\%y<CR>k3Ja

nnoremap <leader>zz :let &scrolloff=999-&scrolloff<CR>

" easy boolean logic because pipe is hard to found
" iabbrev p \|
" iabbrev pp \|\|
iabbrev ea []
iabbrev eo {}
iabbrev ep ()

" vnoremap <tab> >gv
" vnoremap <S-tab> <gv
" delete the content of the current line
" nnoremap D _D

" create a box around a line and comment it TODO create a function and apply
" it to a text object
" nnoremap gb 0i# <esc>A #<esc>YpVr#YkPj:-1,+1Commentary<cr>
" nnoremap gb ^d0i# <C-o>$ #<esc>YpVr#YkP:,+2Commentary<CR>=2jj
nnoremap gb ^d0i│ <esc>A │<esc>YPVjr─p+r└$r┘2-r┌$r┐:,+2Commentary<CR>=2jj
" nnoremap <leader>z !!serieInfo<CR>
" vnoremap <leader>z !serieInfo<CR>
" }}}

" terminal mappings {{{
nnoremap <leader>t :vertical term<cr>
nnoremap <leader>ht :term<cr>
" tnoremap jk <C-W>N
tnoremap <leader>q <C-W>N
tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l

" }}}

" Status line {{{
set laststatus=2 " always show the status line
set noshowmode
set showcmd
set statusline+=%{FugitiveStatusline()}
" }}}

" vimscript language settings {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
	" autocmd FileType vim setlocal foldmarker={{{,}}}
	" autocmd FileType vim setlocal foldtext=foldtext()
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
	return 1
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
	return 1
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
	return 1
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
	return 1
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

" moves the right the separator if it exist, if not moves the left one
function! Right_fbLeftSeparator(n)
	if !RightSeparator(a:n)
		call LeftSeparator(a:n)
	endif
endfunction

" moves the bottom the separator if it exist, if not moves the top one
function! Bottom_fbTopSeparator(n)
	if !BottomSeparator(a:n)
		call TopSeparator(a:n)
	endif
endfunction

nnoremap <silent> <C-Up> :call TopSeparator(2)<cr>
nnoremap <silent> <C-Down> :call TopSeparator(-2)<cr>
nnoremap <silent> <C-Left> :call LeftSeparator(-2)<cr>
nnoremap <silent> <C-Right> :call LeftSeparator(2)<cr>

nnoremap <silent> <Up> :call Bottom_fbTopSeparator(2)<cr>
nnoremap <silent> <Down> :call Bottom_fbTopSeparator(-2)<cr>
nnoremap <silent> <Left> :call Right_fbLeftSeparator(-2)<cr>
nnoremap <silent> <Right> :call Right_fbLeftSeparator(2)<cr>

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
au FileType jess set filetype=clips
au FileType javascript set filetype=javascript.jsx
autocmd FileType clips setlocal commentstring=;\ %s

" signature, email
iabbrev ssig Titouan Teyssier<cr>titouan dot teyssier at gmail dot com<cr>
iabbrev @@ titouan dot teyssier at gmail dot com

" autocmd BufEnter *png,*jpg,*jpeg,*gif exec "! w3m -o ext_image_viewer=0 ".expand("%") | :bw

" cursor shape
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
