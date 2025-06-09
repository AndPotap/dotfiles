if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

USE_CONDA=0

if [ "$USE_CONDA" -eq 1 ]; then
    __conda_setup="$('/Users/andpotap/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
       eval "$__conda_setup"
    else
        if [ -f "/Users/andpotap/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/Users/andpotap/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/Users/andpotap/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup

    conda activate lint
else
    if [ -e $HOME/venv/state.sh ]; then
        source $HOME/venv/state.sh
        venv $VENV
    else
        venv general
    fi
fi

export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$HOME/.local/bin"
export PATH=$PATH:"/opt/homebrew/bin"
export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=${HOME}/go
export PYTHONSTARTUP="$(python3 -m jedi repl)"
export PYTHONPATH=""
export PYTHONPATH=$PYTHONPATH:"$HOME/cola"
export PYTHONPATH=$PYTHONPATH:"$HOME/trainkit"
export PYTHONPATH=$PYTHONPATH:"$HOME/plum"
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=$PATH:/Users/andpotap/.toolbox/bin
