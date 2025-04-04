function findd {
    find . | grep -i ${@}
}
alias alacritty="$HOME/alacritty/target/release/alacritty"
alias py="python3"
alias vc='nvim /tmp/command.txt'
alias vi='nvim'
alias vim='nvim'
alias dot='cd ~/dotfiles'
alias rcf="ruff check --fix"
alias rm='rm -I'
alias mv='mv -i'
alias c='clear'
alias ls='ls --color'
alias lsa='ls --color -a'
alias lst='ls --color -t'
alias lsl='ls --color -l'
alias sync='$HOME/bin/sync'
alias myip='curl ifconfig.me'

# Shortcuts to proyects
alias pro='cd ~/r-roulette-gps'
alias not='cd ~/notes && gp'
alias dot='cd ~/dotfiles'

# TMUX aliases
alias tls='tmux ls'
alias tkill='tmux kill-session -t'
alias tas='tmux attach-session -t'
alias tn='tmux new -s'
alias ta='tmux a'

# Linux only aliases
alias grep='grep --color=auto'
alias upd='sudo apt-get update -y && sudo apt-get upgrade -y'
alias shut='sudo shutdown -h now'
alias restart='sudo shutdown -r now'
alias pic='eog'

# Git aliases
alias gac='git add . && git commit'
alias gapp='git add . && git commit -m "Added" && git pull && git push'
alias gp='git pull'
alias gh='git push'
alias gpp='git pull && git push'
alias gs='clear && git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias grr='git reset --hard & git fetch --all & git pull'

function BranchGit {
    echo "Branch named ${1}"
    git push origin HEAD:${1}
    git branch --set-upstream-to=origin/${1} ${1}
    git push --set-upstream origin ${1}
}
function ExpandArXiv {
    # $1 = 2103.00020  # arXiv file
    # $2 = clip  # name of folder to create
    echo "Expanding arXiv source for paper ${2}"
    mkdir ${2}
    mv ${1} ${2}.tar
    mv ${2}.tar ${2}/
    cd ${2}/
    tar -xf ${2}.tar
    rm ${2}.tar
    cd ..
}
function sGPU {
    export CUDA_VISIBLE_DEVICES=${1}
    echo $CUDA_VISIBLE_DEVICES
}
function venv {
    source $HOME/venv/$1/bin/activate
    alias py=$HOME/venv/$1/bin/python3
}
# Computer specific aliases
# source $HOME/.bash_additional_aliases
alias randomGPU='export CUDA_VISIBLE_DEVICES=$((( RANDOM % 8 ))) && echo $CUDA_VISIBLE_DEVICES'
alias GPU='echo $CUDA_VISIBLE_DEVICES'
alias gsg='gpustat -cpu'
function venv {
    source $HOME/venv/$1/bin/activate
    alias py=$HOME/venv/$1/bin/python3
}
function set_venv {
    echo "export VENV=${1}" > $HOME/venv/state.sh
}
get_free_gpu() {
    # Get the list of GPU IDs to check, or default to all GPUs
    local IDs=${1:-$(nvidia-smi --query-gpu=index --format=csv,noheader,nounits | tr '\n' ' ')}

    for ID in $IDs; do
        MEM_USED=$(nvidia-smi --id=$ID --query-gpu=memory.used --format=csv,nounits,noheader)
        if [ "$MEM_USED" -lt 500 ]; then
            echo "$ID"
            return 0
        fi
    done

    sleep 10
    get_free_gpu "$IDs"
}
