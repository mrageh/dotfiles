#Exports
export PATH="$HOME/.bin:$PATH"

#Editors
export VISUAL=vim
export EDITOR=$VISUAL

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"

# npm binaries
export PATH=/usr/local/share/npm/bin:$PATH

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

#Setup mysql
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

#Custom scripts
export PATH="~/custom/scripts:$PATH"

# Source prompt
source ~/dotfiles/bash-powerline.sh

# Some direnv stuff
eval "$(direnv hook bash)"

#rbenv setup
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#Setup go
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin
