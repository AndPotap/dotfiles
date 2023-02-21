function findd {
    find . | grep -i ${@}
}
alias alacritty="$HOME/alacritty/target/release/alacritty"
alias py='python3'
alias vc='nvim /tmp/command.txt'
alias vi='nvim'
alias vim='nvim'
alias dot='cd ~/dotfiles'
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

# Computer specific aliases
alias white='totem ~/Videos/white.mp4'
alias zpa='zathura ~/Documents/Papers/projects/pactl/pactl_neurips2022.pdf &'
alias dpp='cd ~/Documents/Papers/projects'
alias dbr='cd ~/Documents/Books/Reading'
function BranchGit {
    echo "Branch named ${1}"
    git push origin HEAD:${1}
    git branch --set-upstream-to=origin/${1} ${1}
    git push --set-upstream origin ${1}
}
function ExpandArXiv {
    echo "Expanding arXiv source for paper ${2}"
    mkdir ${2}
    mv ${1} ${2}.tar
    mv ${2}.tar ${2}/
    cd ${2}/
    tar -xf ${2}.tar
    rm ${2}.tar
    cd ..
}
