export EDITOR=vim
export PATH=$PATH:/home/pure/bin
export PATH=/usr/local/texlive/2019/bin/x86_64-linux:$PATH
export PATH="/home/pop/anaconda/bin:$PATH"
export PYTHONPATH=$PYTHONPATH:"/home/pop/"
export PYTHONPATH=$PYTHONPATH:"/home/pop/bnn_hmc"
export PYTHONSTARTUP="$(python3.9 -m jedi repl)"
bind -r '\C-s'
bind '";":"\e"'
bind "set completion-ignore-case on"
stty -ixon
source ~/.bashrc
# Cargo is for alacritty
. "$HOME/.cargo/env"
