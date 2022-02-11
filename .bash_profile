export EDITOR=vim
export PATH=$PATH:"$HOME/bin"
export GOPATH=${HOME}/go
export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin
export PYTHONPATH=$PYTHONPATH:"$HOME"
export PYTHONPATH=$PYTHONPATH:"$HOME/gpytorch"
export PYTHONPATH=$PYTHONPATH:"/$HOME/bayesian_benchmarks"
export PYTHONSTARTUP="$(python3.8 -m jedi repl)"
eval `dircolors -b $HOME/.dir_colors`
bind -r '\C-s'
bind '";":"\e"'
bind "set completion-ignore-case on"
stty -ixon
source ~/.bashrc
# Cargo is for alacritty
. "$HOME/.cargo/env"
