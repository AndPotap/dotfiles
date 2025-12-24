if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

agent_file="$HOME/.ssh/agent_env"
if [[ ! -S $HOME/.ssh/ssh-agent.sock ]]; then
    rm -f $HOME/.ssh/ssh-agent.sock
    eval $(ssh-agent -a $HOME/.ssh/ssh-agent.sock) > "$agent_file"
    ssh-add ~/.ssh/id_git_24
fi
export SSH_AUTH_SOCK="$HOME/.ssh/ssh-agent.sock"
ssh-add -l >/dev/null 2>&1


USE_CONDA=0

if [ "$USE_CONDA" -eq 1 ]; then
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/andres_p/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/andres_p/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/home/andres_p/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/andres_p/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

    conda activate struct
else
    if [ -e $HOME/venv/state.sh ]; then
        source $HOME/venv/state.sh
        venv $VENV
    else
        venv general
    fi
fi

randomGPU

export OMP_NUM_THREADS=4
export TORCH_CUDA_ARCH_LIST="7.5"
export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$HOME/.local/bin"
export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=${HOME}/go
export PYTHONSTARTUP="$(python3 -m jedi repl)"
export PYTHONPATH=""
export PYTHONPATH=$PYTHONPATH:"$HOME/cola"
export PYTHONPATH=$PYTHONPATH:"$HOME/struct_approx"
export PYTHONPATH=$PYTHONPATH:"$HOME/trainkit"
export PYTHONPATH=$PYTHONPATH:"$HOME/plum"
export PYTHONPATH=$PYTHONPATH:"$HOME/PFNs"
export PYTHONPATH=$PYTHONPATH:"$HOME/data_generation/src"
export CPATH=""
export CPATH=$CPATH:"/home/andres_p/cutlass/include"
export CPATH=$CPATH:"/home/andres_p/cutlass/tools/util/include"
export CPATH=$CPATH:"/home/andres_p/cutlass/examples/common"
export CPATH=$CPATH:"/home/andres_p/venv/cuda/lib/python3.11/site-packages/torch/include"
export CPATH=$CPATH:"/home/andres_p/venv/cuda/lib/python3.11/site-packages/torch/include/torch/csrc/api/include"
# export CPATH=$CPATH:"/home/andres_p/venv/cuda/lib/python3.11/site-packages/torch/include/TH"
# export CPATH=$CPATH:"/home/andres_p/venv/cuda/lib/python3.11/site-packages/torch/include/THC"
