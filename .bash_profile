if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

if [ -e $HOME/venv/state.sh ]; then
    source $HOME/venv/state.sh
    venv $VENV
else
    venv general

export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$HOME/.local/bin"
export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=${HOME}/go
export PYTHONSTARTUP="$(python3 -m jedi repl)"
export PYTHONPATH=""
export PYTHONPATH=$PYTHONPATH:"$HOME"
export PYTHONPATH=$PYTHONPATH:"$HOME/cola"
export PYTHONPATH=$PYTHONPATH:"$HOME/gpytorch"
export PYTHONPATH=$PYTHONPATH:"$HOME/linear_operator"
export PYTHONPATH=$PYTHONPATH:"$HOME/numerical-methods"
export PYTHONPATH=$PYTHONPATH:"$HOME/high_stats"
export PYTHONPATH=$PYTHONPATH:"$HOME/code_examples"
export PYTHONPATH=$PYTHONPATH:"$HOME/code_examples/regex"
# export PYTHONPATH=$PYTHONPATH:"$HOME/equivariant-MLP/emlp"
export PYTHONPATH=$PYTHONPATH:"$HOME/equivariant-MLP/"
export PYTHONPATH=$PYTHONPATH:"$HOME/trainkit"
