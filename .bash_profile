export PATH=$PATH:/home/pure/bin
export PATH=/usr/local/texlive/2019/bin/x86_64-linux:$PATH
export PATH="/home/pure/anaconda3/bin:$PATH"
export PYTHONPATH=$PYTHONPATH:"/home/pure/igr"
export PYTHONPATH=$PYTHONPATH:"/home/pure/cbetadir"
export EDITOR=vim
export PYTHONSTARTUP="$(python -m jedi repl)"
bind -r '\C-s'
stty -ixon
xmodmap ~/.xmodmap
source ~/.bashrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/andpotap/google-cloud-sdk/path.bash.inc' ]; then . '/Users/andpotap/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/andpotap/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/andpotap/google-cloud-sdk/completion.bash.inc'; fi

export PATH="$HOME/.cargo/bin:$PATH"
