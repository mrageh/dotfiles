if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

#[ -f ~/.gnupg/gpg-agent.env ] && source ~/.gnupg/gpg-agent.env */
#if [ -S "${GPG_AGENT_INFO%%:*}" ]; then */
#  export GPG_AGENT_INFO */
#else */
#  eval $(gpg-agent --daemon --log-file /tmp/gpg.log --pinentry-program /usr/local/bin/pinentry-mac) */
#fi */

export PATH="$HOME/.cargo/bin:$PATH"

#Setup NVM
export NVM_DIR="$HOME/.nvm"
 . "$(brew --prefix nvm)/nvm.sh"

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

#load chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-2.6.3

# Created by `pipx` on 2021-10-02 13:36:59
export PATH="$PATH:/Users/adam/.local/bin"
