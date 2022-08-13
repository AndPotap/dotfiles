export EDITOR=vim
export PATH=$PATH:"/home/$USER/bin"
export PYTHONPATH=$PYTHONPATH:"/home$USER/tetradic-delights"
export PYTHONSTARTUP="$(python3 -m jedi repl)"
export WANDB_API_KEY=1acdbe06e1ba19e0c9dd6cb839baa5284745a413
export WANDB_DISABLE_CODE=true
export WANDB_USERNAME=andpotap
bind -r '\C-s'
bind '";":"\e"'
bind "set completion-ignore-case on"
stty -ixon
source ~/.bashrc
# . "$HOME/.cargo/env"
# . $HOME/.bash_profile_san
