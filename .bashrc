HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize
export HISTCONTROL=ignoreboth:erasedups
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

bind '";":"\e"'
bind "set completion-ignore-case on"
shopt -s cdspell
complete -d cd

orange=$(tput setaf 166);
yellow=$(tput setaf 11);
green=$(tput setaf 71);
blue=$(tput setaf 4);
gray=$(tput setaf 242);
red=$(tput setaf 9);
bold=$(tput bold);
# reset=$(tput sgr0);
text=$(tput setaf 249);

PS1="\[${bold}\]\n";
PS1+="\[${blue}\]\u";
PS1+="\[${gray}\]@\h: ";
PS1+="\[${green}\]\w ";
# PS1+="\[${blue}\]\n --> ";
# PS1+="\[${reset}\]";
PS1+="\[${text}\]\n --> ";
export PS1;

source ~/.bash_aliases
xmodmap ~/.xmodmap
set -o vi

export MANPAGER="/bin/sh -c \"unset MANPAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/pure/google-cloud-sdk/path.bash.inc' ]; then . '/home/pure/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/pure/google-cloud-sdk/completion.bash.inc' ]; then . '/home/pure/google-cloud-sdk/completion.bash.inc'; fi
