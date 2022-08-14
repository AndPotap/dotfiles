source ~/.bash_aliases
source ~/.bash_profile

HISTSIZE=1000
HISTFILESIZE=2000
complete -d cd
shopt -s cdspell
shopt -s histappend
shopt -s checkwinsize
export HISTCONTROL=ignoreboth:erasedups
GCC_COLORS='error=01;31:warning=01;35:note=01;36'
export GCC_COLORS+=':caret=01;32:locus=01:quote=01'

export PATH=$PATH:"/home/$USER/bin"
export PYTHONPATH=$PYTHONPATH:"/home/$USER/tetradic-delights"
export PYTHONPATH=$PYTHONPATH:"/home/$USER/equivariant-MLP"
export PYTHONSTARTUP="$(python3 -m jedi repl)"
export WANDB_API_KEY=1acdbe06e1ba19e0c9dd6cb839baa5284745a413
export WANDB_DISABLE_CODE=true
export WANDB_USERNAME=andpotap
bind -r '\C-s'
bind '";":"\e"'
bind "set completion-ignore-case on"
stty -ixon
DIR=/ext3
if [ -d "$DIR" ]; then
    source /ext3/miniconda3/etc/profile.d/conda.sh
    export PATH=/ext3/miniconda3/bin:$PATH
    export PYTHONPATH=/ext3/miniconda3/bin:$PYTHONPATH
    alias py='/ext3/miniconda3/bin/python3'
fi
# . $HOME/.bash_profile_san
