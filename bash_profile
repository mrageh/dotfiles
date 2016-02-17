for f in `brew --prefix`/etc/bash_completion.d/*; do
  source $f
done

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

