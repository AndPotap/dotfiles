export EDITOR=vim
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
# . "$HOME/.cargo/env"
# . $HOME/.bash_profile_san
DIR=/ext3
if [ -d "$DIR" ]; then
    source /ext3/miniconda3/etc/profile.d/conda.sh
    export PATH=/ext3/miniconda3/bin:$PATH
    export PYTHONPATH=/ext3/miniconda3/bin:$PYTHONPATH
    alias py='/ext3/miniconda3/bin/python3'
fi
