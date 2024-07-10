
### Oh-My-Posh ###
eval "$(oh-my-posh init zsh --config $HOME/.config/zsh/theme.toml)"

### Zoxide ###
eval "$(zoxide init zsh)"

### Aliases ###
alias i3config='nvim ~/.config/i3/config'
alias cd='z'

### Auto Start Tmux ###
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
