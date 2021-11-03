# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Lines configured by zsh-newuser-install
HISTFILE="$HOME/.local/share/zsh/history"
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_ALL_DUPS
setopt histignorespace


setopt extendedglob correct
bindkey -v
# End of lines configured by zsh-newuser-install


##  Remembering recent dirs ##

# DIRSTACKFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/dirs"
# if [[ -f "$DIRSTACKFILE" ]] && (( ${#dirstack} == 0 )); then
# 	dirstack=("${(@f)"$(< "$DIRSTACKFILE")"}")
# 	[[ -d "${dirstack[1]}" ]] && cd -- "${dirstack[1]}"
# fi
# chpwd_dirstack() {
# 	print -l -- "$PWD" "${(u)dirstack[@]}" > "$DIRSTACKFILE"
# }
# 
# autoload -Uz add-zsh-hook
# add-zsh-hook -Uz chpwd chpwd_dirstack
# 
# DIRSTACKSIZE='20'
# 
# setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME

# #Remove duplicate entries
# setopt PUSHD_IGNORE_DUPS
# 
# #This reverts the +/- operators.
# setopt PUSHD_MINUS
###          ##



# #Update path rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

source $ZDOTDIR/sources
