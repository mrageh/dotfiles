if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

#[ -f ~/.gnupg/gpg-agent.env ] && source ~/.gnupg/gpg-agent.env */
#if [ -S "${GPG_AGENT_INFO%%:*}" ]; then */
#  export GPG_AGENT_INFO */
#else */
#  eval $(gpg-agent --daemon --log-file /tmp/gpg.log --pinentry-program /usr/local/bin/pinentry-mac) */
#fi */

export PATH="$HOME/.cargo/bin:$PATH"
