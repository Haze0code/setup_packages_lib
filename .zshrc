# ~/.zshrc

# ===== Oh My Zsh =====
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugins : git, sudo et z sont fournis par oh-my-zsh,
# les deux derniers sont téléchargés par setup.sh
plugins=(
    git                       # alias git (gst, gco, gp…) + branche dans le prompt
    sudo                      # Échap deux fois : ajoute sudo devant la commande
    z                         # « z dossier » : saute vers un dossier fréquent
    zsh-autosuggestions       # suggestions grisées depuis l'historique
    zsh-syntax-highlighting   # coloration de la commande (toujours en dernier)
)

source "$ZSH/oh-my-zsh.sh"

# ===== Historique =====
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS     # pas de doublons
setopt SHARE_HISTORY            # historique partagé entre les terminaux

# ===== Environnement =====
export EDITOR="vim"

# ===== Alias =====
alias ll='ls -lah'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias gs='git status'
alias update='apt update && apt upgrade -y'
alias reload='source ~/.zshrc'
alias zshrc='vim ~/.zshrc'

# ===== Fonctions =====
# Crée un dossier et entre dedans
mkcd() { mkdir -p "$1" && cd "$1"; }
