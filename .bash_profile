export PATH=$PATH:/home/debby/bin
export PATH="/home/debby/anaconda3/bin:$PATH"
export PYTHONPATH=$PYTHONPATH:"/home/debby/igr"
export PATH=$PATH:/usr/local/go/bin
export PYTHONSTARTUP="$(python -m jedi repl)"
bind -r '\C-s'
stty -ixon
source ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
