#Exports
export PATH="$HOME/.bin:$PATH"

#Editors
export VISUAL=vim
export EDITOR=$VISUAL

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"
eval "$(rbenv init - --no-rehash)"

export PATH="/usr/local/bin:$PATH"

# npm binaries
export PATH=/usr/local/share/npm/bin:$PATH

# Go binaires
export GOPATH=$HOME/programming/learning/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

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

# Source prompt
source ~/.bash-powerline.sh

# Some direnv stuff
eval "$(direnv hook bash)"
