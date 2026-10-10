" ~/.vimrc
syntax on                       " coloration syntaxique
filetype plugin indent on       " indentation selon le langage
set encoding=utf-8

" Affichage
set number                      " numéros de ligne
set relativenumber              " numéros relatifs (pratique pour les sauts)
set cursorline                  " surligne la ligne courante
set showmatch                   " parenthèse correspondante
set laststatus=2 ruler          " barre d'état + position du curseur
set wildmenu                    " complétion des commandes avec Tab

" Indentation : 4 espaces
set expandtab
set tabstop=4 shiftwidth=4 softtabstop=4
set autoindent smartindent

" Recherche
set hlsearch incsearch          " recherche surlignée et progressive
set ignorecase smartcase        " insensible à la casse sauf si majuscule

" Confort
set mouse=a                     " souris active
set backspace=indent,eol,start  " Retour arrière normal
set scrolloff=5                 " garde 5 lignes visibles autour du curseur
