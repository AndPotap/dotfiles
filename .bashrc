complete -d cd
shopt -s checkwinsize
export HISTCONTROL=ignoreboth:erasedups
export f=~
bind '";":"\e"'
bind "set completion-ignore-case on"
shopt -s cdspell
shopt -s histappend
set -o vi
source ~/.bash_aliases
HISTSIZE=1000
HISTFILESIZE=2000

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
