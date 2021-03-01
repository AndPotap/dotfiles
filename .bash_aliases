alias ls='gls --color=auto'
alias vc='nvim /tmp/command.txt'
alias dot='cd ~/dotfiles'
alias rm='grm -I'
alias white='totem ~/Videos/white.mp4'
alias mv='mv -i'
alias lsa='ls -a'
alias c='clear'

# Shortcuts to proyects
alias pro='cd ~/r-roulette-gps'
alias not='cd ~/notes && gp'
alias dot='cd ~/dotfiles'

# TMUX aliases
alias tls='tmux ls'
alias tkill='tmux kill-session -t'
alias tas='tmux attach-session -t'
alias ta='tmux a'

# Linux only aliases
# alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias upd='sudo apt-get update -y && sudo apt-get upgrade -y'
alias shut='sudo shutdown -h now'
alias restart='sudo shutdown -r now'
alias pic='eog'

# Git aliases
alias gac='git add . && git commit'
alias gp='git pull'
alias gh='git push'
alias gpp='git pull && git push'
alias gs='clear && git status'
alias gc='git commit'
alias ga='git add'
# alias go='git checkout'
alias gd='git diff'
alias grr='git reset --hard & git fetch --all & git pull'

alias o='open'
