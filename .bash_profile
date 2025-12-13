if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

if [ -e $HOME/venv/state.sh ]; then
    source $HOME/venv/state.sh
    venv $VENV
else
    venv general
fi

export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$HOME/.local/bin"
export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=${HOME}/go
export PYTHONSTARTUP="$(python3 -m jedi repl)"
export PYTHONPATH=""
export PYTHONPATH=$PYTHONPATH:"$HOME/cola"
export PYTHONPATH=$PYTHONPATH:"$HOME/trainkit"
export PYTHONPATH=$PYTHONPATH:"$HOME/plum"
export PYTHONPATH=$PYTHONPATH:"$HOME/transformers-nla"
export PYTHONPATH=$PYTHONPATH:"$HOME/chronos-forecasting/src"
export PYTHONPATH=$PYTHONPATH:"$HOME/TabPFN/src"
export PYTHONPATH=$PYTHONPATH:"$HOME/PFNs"
export PYTHONPATH=$PYTHONPATH:"$HOME/data_generation/src"
