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

#Setup mysql
export PATH="/usr/local/opt/mysql/bin:$PATH"

#Custom scripts
export PATH="~/custom/scripts:$PATH"

# Source prompt
source ~/dotfiles/bash-powerline.sh

# Some direnv stuff
eval "$(direnv hook bash)"

#rbenv setup
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

#Setup go
export GOPATH=$HOME/dev/go
export GOBIN=$GOPATH/bin

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#Enable iex shell history
export ERL_AFLAGS="-kernel shell_history enabled"

#Use rg with FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export PATH="/usr/local/opt/go@1.12/bin:$PATH"
export PATH="/Users/adam/dev/go/src/github.com/jenkins-x/jx/build:$PATH"
