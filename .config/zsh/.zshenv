typeset -U PATH path
path=("$path[@]")
export PATH
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1
