#Exports
export PATH="$HOME/.bin:$PATH"

#Editors
export VISUAL=nvim
export EDITOR=$VISUAL

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"

# Aliases
[[ -f ~/.aliases ]] && source ~/.aliases

#Custom Bash functions
# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}

#Modern command prompt
eval "$(starship init bash)"

#Setup mysql
export PATH="/usr/local/opt/mysql/bin:$PATH"

#Custom scripts
export PATH="~/custom/scripts:$PATH"

# Some direnv stuff
eval "$(direnv hook bash)"

#Setup go
export GOPATH=$HOME/dev/go
export PATH=$GOPATH/bin:$PATH
export GO111MODULE=auto

#Enable iex shell history
export ERL_AFLAGS="-kernel shell_history enabled"

#fzf
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_DEFAULT_OPTS='-m --height 40% --layout=reverse --border'
export FZF_CTRL_T_OPTS="--preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
export SKIM_DEFAULT_COMMAND="rg --files || fd || find ."
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
_fzf_compgen_path() {
  echo "$1"
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  echo "$1"
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

#Google cloud SDK
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"

#Pyenv setup
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
