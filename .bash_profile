if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$HOME/.local/bin"
export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=${HOME}/go
export PYTHONSTARTUP="$(python3 -m jedi repl)"
export PYTHONPATH=$PYTHONPATH:"$HOME"
export PYTHONPATH=$PYTHONPATH:"$HOME/.local/bin"
export PYTHONPATH=$PYTHONPATH:"$HOME/bayesian_benchmarks"
export PYTHONPATH=$PYTHONPATH:"$HOME/lowpres_gps"
export PYTHONPATH=$PYTHONPATH:"$HOME/equivariant-MLP"
