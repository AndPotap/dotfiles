# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export EDITOR='vim'

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export HISTCONTROL=ignoreboth:erasedups
export f=~

bind '";":"\e"'
bind "set completion-ignore-case on"
shopt -s cdspell
complete -d cd

orange=$(tput setaf 166);
yellow=$(tput setaf 11);
green=$(tput setaf 71);
blue=$(tput setaf 27);
gray=$(tput setaf 242);
red=$(tput setaf 9);
bold=$(tput bold);
reset=$(tput sgr0);

PS1="\[${bold}\]\n";
PS1+="\[${orange}\]\u";
PS1+="\[${gray}\]@\h: ";
PS1+="\[${green}\]\w ";
PS1+="\[${orange}\]\n --> ";
PS1+="\[${reset}\]";
export PS1;

# export CLICOLOR=1
# export LSCOLORS=exxxxxxxxxxxxxxxxxxxxx

source ~/.bash_aliases
set -o vi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export GOPATH=${HOME}/go
export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/debby/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/debby/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/debby/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/debby/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

