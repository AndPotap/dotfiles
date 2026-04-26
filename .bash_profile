if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

# if [ -e $HOME/venv/state.sh ]; then
#     source $HOME/venv/state.sh
#     venv $VENV
# else
#     venv general
# fi

export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$HOME/.local/bin"
export GOPATH=${HOME}/go
export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin
export PATH=$PATH:/usr/local/go/bin
export PYTHONSTARTUP="$(python3 -m jedi repl)"
export PYTHONPATH=""
