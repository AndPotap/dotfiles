# if [[ ! -d "$HOME/efs/andpotap" ]]; then
#     echo "Mounting EFS"
#     sudo mount -t efs -o tls,iam fs-9c2846d5 $HOME/efs/
# fi

agent_file="$HOME/.ssh/agent_env"
if [[ ! -S $HOME/.ssh/ssh-agent.sock ]]; then
    rm -f $HOME/.ssh/ssh-agent.sock
    eval $(ssh-agent -a $HOME/.ssh/ssh-agent.sock) > "$agent_file"
    ssh-add ~/.ssh/id_git_24
fi
export SSH_AUTH_SOCK="$HOME/.ssh/ssh-agent.sock"
ssh-add -l >/dev/null 2>&1

if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi


if [ ! -e .venv ]; then
    if [ -e $HOME/venv/state.sh ]; then
        source $HOME/venv/state.sh
        venv $VENV
    else
        venv general
    fi
else
    source .venv/bin/activate
fi

export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$HOME/.local/bin"
export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=${HOME}/go
# export PYTHONSTARTUP="$(python3 -m jedi repl)"
export PYTHONPATH=""
export PYTHONPATH=$PYTHONPATH:"$HOME/cola"
export PYTHONPATH=$PYTHONPATH:"$HOME/trainkit"
export PYTHONPATH=$PYTHONPATH:"$HOME/plum"
export PYTHONPATH=$PYTHONPATH:"$HOME/data_generation/src"
export PYTHONPATH=$PYTHONPATH:"$HOME/scaling-lib"
export PYTHONPATH=$PYTHONPATH:"$HOME/DeepTSv3"
export PYTHONPATH=$PYTHONPATH:"$HOME/FarsightA"
. "$HOME/.cargo/env"

. "$HOME/.local/bin/env"
