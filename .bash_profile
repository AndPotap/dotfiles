export PATH=$PATH:/home/ubu/bin
export PATH="/home/ubu/anaconda3/bin:$PATH"
# export PYTHONPATH=$PYTHONPATH:"/home/debby/igr"
# export PATH=$PATH:/usr/local/go/bin
export PYTHONSTARTUP="$(python -m jedi repl)"
export PATH="$HOME/.cargo/bin:$PATH"
bind -r '\C-s'
stty -ixon
source ~/.bashrc
