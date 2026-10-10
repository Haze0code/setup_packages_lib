" =============================================================================
"  ~/.vimrc — déployé par setup-env (aucun plugin requis)
" =============================================================================

set nocompatible
filetype plugin indent on
syntax on
set encoding=utf-8

" --- Affichage -------------------------------------------------------------------
set number relativenumber      " numéros de ligne (relatifs pour les sauts)
set cursorline                 " surligne la ligne courante
set showmatch                  " parenthèse correspondante
set laststatus=2 ruler showcmd
set wildmenu wildmode=longest:full,full
set scrolloff=5
set background=dark
set list listchars=tab:»\ ,trail:·,nbsp:␣
set statusline=%f\ %m%r%h%w%=%y\ [%{&fileencoding}]\ %l:%c\ %p%%

" --- Indentation (4 espaces) ------------------------------------------------------
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
set autoindent smartindent
autocmd FileType make setlocal noexpandtab
autocmd FileType yaml,json,javascript,typescript,html,css setlocal tabstop=2 shiftwidth=2 softtabstop=2

" --- Recherche ---------------------------------------------------------------------
set incsearch hlsearch ignorecase smartcase

" --- Confort -----------------------------------------------------------------------
set mouse=a
set backspace=indent,eol,start
set hidden
set history=1000
set updatetime=300

" Annulation persistante et fichiers temporaires hors du projet
set undofile undodir=~/.vim/undo//
set directory=~/.vim/swap//
set backupdir=~/.vim/backup//

" Rouvre un fichier à la dernière position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" --- Raccourcis (leader = espace) ---------------------------------------------------
let mapleader = " "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>e :Explore<CR>
" Supprime les espaces en fin de ligne
nnoremap <leader>t :%s/\s\+$//e<CR>
