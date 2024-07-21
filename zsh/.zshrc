
### Oh-My-Posh ###
eval "$(oh-my-posh init zsh --config $HOME/.config/zsh/theme.toml)"

### Zoxide ###
eval "$(zoxide init zsh)"

### History ###
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

### Plugins ###
source ~/.config/zsh/plugins/zsh-history-substring-search.zsh


### Keybinds ###
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

### Aliases ###
alias i3config='nvim ~/.config/i3/config'
alias cd='z'
