#!/bin/sh

# This is a modified version of thoughtbot's laptop script

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

append_to_bashrc() {
  fancy_echo "Append something to bashrc ..."
  local text="$1" bashrc
  local skip_new_line="${2:-0}"

  bashrc="$HOME/.bashrc"

  if ! grep -Fqs "$text" "$bashrc"; then
    if [ "$skip_new_line" -eq 1 ]; then
      printf "%s\n" "$text" >> "$bashrc"
    else
      printf "\n%s\n" "$text" >> "$bashrc"
    fi
  fi
}


if [ ! -d "$HOME/.bin/" ]; then
  mkdir "$HOME/.bin"
fi

if [ ! -f "$HOME/.bashrc" ]; then
  touch "$HOME/.bashrc"
fi

append_to_bashrc 'export PATH="$HOME/.bin:$PATH"'

HOMEBREW_PREFIX="/usr/local"

if [ -d "$HOMEBREW_PREFIX" ]; then
  if ! [ -r "$HOMEBREW_PREFIX" ]; then
    sudo chown -R "$LOGNAME:admin" /usr/local
  fi
else
  sudo mkdir "$HOMEBREW_PREFIX"
  sudo chflags norestricted "$HOMEBREW_PREFIX"
  sudo chown -R "$LOGNAME:admin" "$HOMEBREW_PREFIX"
fi

case "$SHELL" in
  */bash) : ;;
  *)
    fancy_echo "Changing your shell to bash ..."
      chsh -s "$(which bash)"
    ;;
esac

brew_is_installed() {
  local name
  name="$(brew_expand_alias "$1")"

  brew list -1 | grep -Fqx "$name"
}

brew_is_upgradable() {
  local name
  name="$(brew_expand_alias "$1")"

  ! brew outdated --quiet "$name" >/dev/null
}

brew_install_or_upgrade() {
  if brew_is_installed "$1"; then
    if brew_is_upgradable "$1"; then
      brew upgrade "$@"
    fi
  else
    brew install "$@"
  fi
}


brew_tap() {
  brew tap "$1" --repair 2> /dev/null
}

brew_expand_alias() {
  brew info "$1" 2>/dev/null | head -1 | awk '{gsub(/.*\//, ""); gsub(/:/, ""); print $1}'
}

brew_launchctl_restart() {
  local name
  name="$(brew_expand_alias "$1")"
  local domain="homebrew.mxcl.$name"
  local plist="$domain.plist"

  mkdir -p "$HOME/Library/LaunchAgents"
  ln -sfv "/usr/local/opt/$name/$plist" "$HOME/Library/LaunchAgents"

  if launchctl list | grep -Fq "$domain"; then
    launchctl unload "$HOME/Library/LaunchAgents/$plist" >/dev/null
  fi
  launchctl load "$HOME/Library/LaunchAgents/$plist" >/dev/null
}

gem_install_or_update() {
  if gem list "$1" --installed > /dev/null; then
    gem update "$@"
  else
    gem install "$@"
    rbenv rehash
  fi
}

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

    append_to_bashrc '# recommended by brew doctor'

    # shellcheck disable=SC2016
    append_to_bashrc 'export PATH="/usr/local/bin:$PATH"' 1

    export PATH="/usr/local/bin:$PATH"
fi

if brew list | grep -Fq brew-cask; then
  fancy_echo "Uninstalling old Homebrew-Cask ..."
  brew uninstall --force brew-cask
fi

fancy_echo "Updating Homebrew formulae ..."

brew update
fancy_echo "Updating Unix tools ..."
brew_install_or_upgrade 'ctags'
brew_install_or_upgrade 'git'
brew_install_or_upgrade 'openssl'
brew_install_or_upgrade 'neovim'
brew_install_or_upgrade 'reattach-to-user-namespace'
brew_install_or_upgrade 'ripgrep'
brew_install_or_upgrade 'tmux'
brew_install_or_upgrade 'bash'
brew_install_or_upgrade "ssh-copy-id"
brew_install_or_upgrade "starship"
brew_install_or_upgrade "pidof"
brew_install_or_upgrade "jq"
brew_install_or_upgrade "httpie"
brew_install_or_upgrade "htop"
brew_install_or_upgrade "nmap"
brew_install_or_upgrade "fd"
brew_install_or_upgrade "fzf"
brew_install_or_upgrade "pv"
brew_install_or_upgrade "fzf"
brew_install_or_upgrade "htop"
brew_install_or_upgrade "direnv"
brew_install_or_upgrade "cowsay"
brew_install_or_upgrade "bash-completion"
brew_install_or_upgrade "tree"
brew_install_or_upgrade "procs"
brew_install_or_upgrade "tokei"

fancy_echo "Updating programming languages ..."
brew_install_or_upgrade 'libyaml' # should come after openssl
brew_install_or_upgrade 'rbenv'
brew_install_or_upgrade 'ruby-build'
brew_install_or_upgrade 'ruby-install'
brew_install_or_upgrade 'go'
brew_install_or_upgrade 'pyenv'
brew_install_or_upgrade 'nvm'

fancy_echo "Updating databases ..."
brew_install_or_upgrade 'postgres'
brew_install_or_upgrade 'mysql'
brew_install_or_upgrade 'redis'
brew_launchctl_restart 'postgresql'
brew_launchctl_restart 'mysql'
brew_launchctl_restart 'redis'

#number_of_cores=$(sysctl -n hw.ncpu)
#bundle config --global jobs $((number_of_cores - 1))
