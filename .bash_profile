if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi
source $HOME/fix_ssh.sh
# conda activate pde
conda activate spurious

export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$HOME/.local/bin"
export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=${HOME}/go
export PYTHONSTARTUP="$(python3 -m jedi repl)"
export PYTHONPATH=$PYTHONPATH:"$HOME"
export PYTHONPATH=$PYTHONPATH:"$HOME/tetradic-delights"
export PYTHONPATH=$PYTHONPATH:"$HOME/gpytorch"
export PYTHONPATH=$PYTHONPATH:"$HOME/linear_operator"
export PYTHONPATH=$PYTHONPATH:"/$HOME/equivariant-MLP"
export PYTHONPATH=$PYTHONPATH:"/$HOME/wilds"
