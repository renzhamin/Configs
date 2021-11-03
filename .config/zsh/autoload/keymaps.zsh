autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -v '^e' edit-command-line

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey -v '^[k' kill-whole-line
bindkey -v '^k' kill-line

bindkey -a '^[^[' vi-insert


typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
# key[Control-Left]="${terminfo[kLFT5]}"
# key[Control-Right]="${terminfo[kRIT5]}"

bindkey -v "${key[Home]}"       beginning-of-line
bindkey -v "${key[End]}"        end-of-line
bindkey -v "${key[Insert]}"     overwrite-mode
bindkey -v "${key[Backspace]}"  backward-delete-char
bindkey -v "${key[Delete]}"     delete-char
bindkey -- "${key[Up]}"         history-beginning-search-backward-end
bindkey -- "${key[Down]}"       history-beginning-search-forward-end
# bindkey -- "${key[Left]}"       backward-char
# bindkey -- "${key[Right]}"      forward-char
# bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
# bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

#Control-L/R to move between words

bindkey '^[[1;5D'  backward-word
bindkey '^[[1;5C' forward-word
