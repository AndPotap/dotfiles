export PATH=$PATH:/home/pure/bin
export PATH=/usr/local/texlive/2019/bin/x86_64-linux:$PATH
export PATH="/home/pure/anaconda3/bin:$PATH"
export PYTHONPATH=$PYTHONPATH:"/home/pure/igr"
export PYTHONPATH=$PYTHONPATH:"/home/pure/r-roulette-gps"
export PYTHONPATH=$PYTHONPATH:"/home/pure/gpytorch"
export PYTHONSTARTUP="$(python -m jedi repl)"
export PATH="$HOME/.cargo/bin:$PATH"
bind -r '\C-s'
stty -ixon
source ~/.bashrc
