" VIM Configuration - Titouan Teyssier

" Annule la compatibilite abec l'ancetre Vi : totalement indispensable
set nocompatible
set relativenumber

" Activation de pathogen
call pathogen#infect()

" Activation de NERDTree au lancement de vim
autocmd vimenter * NERDTree

" Affichage
set title

set number
set ruler
set wrap

set scrolloff=3

" Recherche
set ignorecase
set smartcase

set incsearch
set hlsearch

" Beep
set novisualbell
set noerrorbells

" active le comportement 'habituel' de la touche retour en arriere
set backspace=indent,eol,start

" Cache les fichiers lors de l'ouverture d'autres fichiers
set hidden

" Active la coloration syntaxique
syntax enable

" Active les comportements specifiques aux types de fichiers comme la syntaxe et l'indentation
filetype on
filetype plugin on
filetype indent on

" theme solarized
set background=dark
set termguicolors
colorscheme solarized

" settings for hidden chars
set listchars=tab:▒░,trail:▓,space:.
" used \u2592\u2591 for tab and \u2593 for trailing spaces in line.
" In Vim help they suggest using ">-" for tab and "-" for trail.

" hide hidden chars
set nolist

set mouse=a

" Desactiver les touches directionnelles
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Remap de la touche echap pour revenir en mode normal
map ii <Esc>
imap ii <Esc>

" Move one line up and one line down
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
" Highlight from search are no longer a problem whith that map
nnoremap <Space> :noh<cr>

" Make vim use the system clipboard as primary register for copy, cut and
" paste
set number
set clipboard=unnamedplus 


" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20

" Get the defaults that most users want.
"source $VIMRUNTIME/defaults.vim

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file (restore to previous version)
"  if has('persistent_undo')
"    set undofile	" keep an undo file (undo changes after closing)
"  endif
"endif
"
"if &t_Co > 2 || has("gui_running")
"  " Switch on highlighting the last used search pattern.
"  set hlsearch
"endif
"
"" Only do this part when compiled with support for autocommands.
"if has("autocmd")
"
"  " Put these in an autocmd group, so that we can delete them easily.
"  augroup vimrcEx
"  au!
"
"  " For all text files set 'textwidth' to 78 characters.
"  autocmd FileType text setlocal textwidth=78
"
"  augroup END
"
"else
"
"  set autoindent		" always set autoindenting on
"
"endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
"if has('syntax') && has('eval')
"  packadd! matchit
"endif
"
set tabstop=4
set shiftwidth=4
