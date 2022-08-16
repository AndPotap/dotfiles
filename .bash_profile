if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
fi

export PATH=$PATH:"$HOME/bin"
export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin
export GOPATH=${HOME}/go
export PYTHONSTARTUP="$(python3.8 -m jedi repl)"
export PYTHONPATH=$PYTHONPATH:"$HOME"
export PYTHONPATH=$PYTHONPATH:"$HOME/gpytorch"
export PYTHONPATH=$PYTHONPATH:"/$HOME/bayesian_benchmarks"
export PYTHONPATH=$PYTHONPATH:"/$HOME/equivariant-MLP"
export PYTHONPATH=$PYTHONPATH:"/$HOME/nnet-compression-generalization"
export PYTHONPATH=$PYTHONPATH:"/$HOME/pytorch-image-models"
