if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

source $HOME/fix_ssh.sh

# conda activate struct

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
export PYTHONPATH=$PYTHONPATH:"$HOME/tetradic-delights"
export PYTHONPATH=$PYTHONPATH:"$HOME/gpytorch"
export PYTHONPATH=$PYTHONPATH:"$HOME/linear_operator"
export PYTHONPATH=$PYTHONPATH:"$HOME/cola"
export PYTHONPATH=$PYTHONPATH:"$HOME/trainkit"
export PYTHONPATH=$PYTHONPATH:"$HOME/plum"

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/andres_p/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/andres_p/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/andres_p/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/andres_p/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<
