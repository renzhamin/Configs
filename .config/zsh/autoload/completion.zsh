# The following lines were added by compinstall

zstyle :compinstall filename "$ZDOTDIR/.zshrc"

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[_-]=** r:|=** l:|=*'
autoload -Uz compinit
compinit

# End of lines added by compinstall

# kill,killall command
zstyle ':completion:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:processes' command 'ps xo pid,user:10,cmd | grep -v "sshd:|-zsh$"'
zstyle ':completion:*:processes-names' command 'ps xho command|sed "s/://g"'

zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS} "ma=48;5;153;100"
