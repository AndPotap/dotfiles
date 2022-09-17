function findd {
    find . | grep -i ${@}
}
alias alacritty="$HOME/alacritty/target/release/alacritty"
alias py='python3'
alias vc='nvim /tmp/command.txt'
alias vi='$HOME/nvim-linux64/bin/nvim'
alias vim='$HOME/nvim-linux64/bin/nvim'
alias dot='cd ~/dotfiles'
alias rm='rm -I'
alias mv='mv -i'
alias c='clear'
alias ls='ls --color'
alias lsa='ls --color -a'
alias lst='ls --color -t'
alias lsl='ls --color -l'
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

# Computer specific aliases
# source $HOME/.bash_additional_aliases
alias randomGPU='export CUDA_VISIBLE_DEVICES=$((( RANDOM % 8 ))) && echo $CUDA_VISIBLE_DEVICES'
alias GPU='echo $CUDA_VISIBLE_DEVICES'
function sGPU {
    export CUDA_VISIBLE_DEVICES=${1}
    echo $CUDA_VISIBLE_DEVICES
}
