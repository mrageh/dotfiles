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
export PATH=$GOPATH/bin:$PATH
export GO111MODULE=on

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#Enable iex shell history
export ERL_AFLAGS="-kernel shell_history enabled"


#Use rg with FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export PATH="/Users/adam/dev/go/src/github.com/jenkins-x/jx/build:$PATH"
export VAULT_AWS_ACCESS_KEY_ID=AKIARRHJNMV4DCB6KLW4
export VAULT_AWS_SECRET_ACCESS_KEY=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
export JX_GIT_TOKEN=737c512e84dcb8b5ffa9f6fae9e1d71ec0da46aa
alias goland=/usr/local/bin/goland

#SDM vars
export GATEWAY_SERVER=http://localhost:4000
