source $HOME/.bashrc
source $HOME/.bash_paths

agent_file="$HOME/.ssh/agent_env"
if [[ ! -S $HOME/.ssh/ssh-agent.sock ]]; then
    rm -f $HOME/.ssh/ssh-agent.sock
    eval $(ssh-agent -a $HOME/.ssh/ssh-agent.sock) > "$agent_file"
    ssh-add ~/.ssh/id_git_24
fi
export SSH_AUTH_SOCK="$HOME/.ssh/ssh-agent.sock"
ssh-add -l >/dev/null 2>&1
