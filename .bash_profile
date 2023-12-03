if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi
# source $HOME/fix_ssh.sh
source $HOME/.bash_paths

conda activate struct

export PYTHONPATH=$PYTHONPATH:"$HOME/trainkit"
export PYTHONPATH=$PYTHONPATH:"$HOME/cola"
export PYTHONPATH=$PYTHONPATH:"$HOME/plum"
export PYTHONPATH=$PYTHONPATH:"$HOME/second-diffusion"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/ext3/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/ext3/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/ext3/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/ext3/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
