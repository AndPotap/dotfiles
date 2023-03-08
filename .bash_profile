if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$HOME/.local/bin"
export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=${HOME}/go
export PYTHONSTARTUP="$(python3 -m jedi repl)"
export PYTHONPATH=""
export PYTHONPATH=$PYTHONPATH:"$HOME"
export PYTHONPATH=$PYTHONPATH:"$HOME/linops"
export PYTHONPATH=$PYTHONPATH:"$HOME/gpytorch"
export PYTHONPATH=$PYTHONPATH:"$HOME/linear_operator"
export PYTHONPATH=$PYTHONPATH:"$HOME/numerical-methods"
export PYTHONPATH=$PYTHONPATH:"$HOME/break_gps"
export PYTHONPATH=$PYTHONPATH:"$HOME/high_stats"
export PYTHONPATH=$PYTHONPATH:"$HOME/code_examples/regex"
