# =============================================================================
#  ~/.zshrc — déployé par setup-env (ne pas modifier directement)
#  Vos réglages propres à cette machine vont dans ~/.zshrc.local.
# =============================================================================

# --- Oh My Zsh ----------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="haze"
zstyle ':omz:update' mode disabled   # pas de question de mise à jour au démarrage
HIST_STAMPS="yyyy-mm-dd"
COMPLETION_WAITING_DOTS="true"

plugins=(
  git                  # alias git (gst, gco, gp…) + branche dans le prompt
  sudo                 # Échap deux fois : ajoute sudo devant la commande
  extract              # « extract fichier » : décompresse tout format
  z                    # « z projet » : saute vers un dossier fréquent
  colored-man-pages    # pages de manuel en couleur
)
# Plugins chargés seulement s'ils sont disponibles (aucune erreur sinon)
if (( $+commands[fzf] )); then
  plugins+=(fzf)       # Ctrl-R : historique, Ctrl-T : fichiers (recherche floue)
fi
for _plugin in zsh-autosuggestions zsh-syntax-highlighting; do   # toujours en dernier
  if [[ -d "$ZSH/custom/plugins/$_plugin" ]]; then plugins+=("$_plugin"); fi
done
unset _plugin

if [[ -r "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
else
  # Secours si Oh My Zsh n'est pas installé
  autoload -Uz compinit && compinit
  PROMPT='%F{cyan}%n@%m%f %F{blue}%~%f %# '
fi

# --- Historique ----------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE SHARE_HISTORY EXTENDED_HISTORY

# --- Environnement ---------------------------------------------------------------
export EDITOR="vim" VISUAL="vim" PAGER="less" LESS="-R"
typeset -U path                       # pas de doublons dans le PATH
path=("$HOME/.local/bin" "$HOME/bin" $path)

# Locale UTF-8 si la session n'en fournit pas
if [[ -z "$LANG" || "$LANG" == C* || "$LANG" == POSIX ]] \
   && locale -a 2>/dev/null | grep -qix 'en_US.utf8'; then
  export LANG="en_US.UTF-8"
fi

# --- Noms Debian de certains outils ----------------------------------------------
if (( $+commands[batcat] && ! $+commands[bat] )); then alias bat='batcat'; fi
if (( $+commands[fdfind] && ! $+commands[fd] )); then alias fd='fdfind'; fi

# --- ssh-agent : un seul agent partagé par toutes les sessions -------------------
if (( $+commands[ssh-agent] )); then
  _ssh_env="$HOME/.ssh/agent.env"
  [[ -r "$_ssh_env" ]] && source "$_ssh_env" >/dev/null
  ssh-add -l >/dev/null 2>&1
  if (( $? == 2 )); then                 # 2 = aucun agent joignable
    (umask 077; ssh-agent -s >| "$_ssh_env")
    source "$_ssh_env" >/dev/null
  fi
  unset _ssh_env
fi

# --- Alias et fonctions ------------------------------------------------------------
if [[ -r "$HOME/.aliases.zsh" ]]; then source "$HOME/.aliases.zsh"; fi

# --- Réglages locaux (jamais écrasés par setup-env) --------------------------------
if [[ -r "$HOME/.zshrc.local" ]]; then source "$HOME/.zshrc.local"; fi
