if [[ ! -d "$HOME/efs/andpotap" ]]; then
    sudo mount -t efs -o tls,iam fs-9c2846d5 $HOME/efs/
fi

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

if [ -e $HOME/venv/state.sh ]; then
    source $HOME/venv/state.sh
    venv $VENV
else
    venv general
fi

# random_number=$((RANDOM % 8))
# sGPU $random_number

# export DEEP_TS_PATH="$HOME/efs/andpotap/"
# export CUDA_HOME="/usr/local/cuda-11.8"
# export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${CUDA_HOME}/lib
# export GOPATH=${HOME}/go
# export PATH=/usr/bin/
# export PATH=$PATH:${CUDA_HOME}/bin
export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$HOME/.local/bin"
export PATH=$PATH:"$HOME/.fzf/bin"
export PATH=$PATH:"/usr/local/bin"
export PATH=$PATH:"/usr/local/bin/nvim"
export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin
export PATH=$PATH:/usr/local/go/bin
export PYTHONSTARTUP="$(python3 -m jedi repl)"
export PYTHONPATH=""
export PYTHONPATH=$PYTHONPATH:"$HOME/cola"
export PYTHONPATH=$PYTHONPATH:"$HOME/trainkit"
export PYTHONPATH=$PYTHONPATH:"$HOME/tabpfn-time-series"
export PYTHONPATH=$PYTHONPATH:"$HOME/efs/andpotap/DeepTSv3/"
export PYTHONPATH=$PYTHONPATH:"$HOME/efs/andpotap/DeepTSv3Experiments"
