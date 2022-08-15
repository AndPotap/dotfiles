source ~/.bash_aliases
source ~/.bash_profile

HISTSIZE=1000
HISTFILESIZE=2000
complete -d cd
shopt -s cdspell
shopt -s histappend
shopt -s checkwinsize
export EDITOR=vim
export HISTCONTROL=ignoreboth:erasedups
GCC_COLORS='error=01;31:warning=01;35:note=01;36'
export GCC_COLORS+=':caret=01;32:locus=01:quote=01'

export PATH=$PATH:"$HOME/bin"
export GOPATH=${HOME}/go
export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin
export PYTHONPATH=$PYTHONPATH:"$HOME"
export PYTHONPATH=$PYTHONPATH:"$HOME/gpytorch"
export PYTHONPATH=$PYTHONPATH:"/$HOME/bayesian_benchmarks"
export PYTHONPATH=$PYTHONPATH:"/$HOME/equivariant-MLP"
export PYTHONPATH=$PYTHONPATH:"/$HOME/nnet-compression-generalization"
export PYTHONPATH=$PYTHONPATH:"/$HOME/pytorch-image-models"
export PYTHONSTARTUP="$(python3.8 -m jedi repl)"
eval `dircolors -b $HOME/.dir_colors`
bind -r '\C-s'
bind '";":"\e"'
bind "set completion-ignore-case on"
stty -ixon
. "$HOME/.cargo/env"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ubu/google-cloud-sdk/path.bash.inc' ]; then . '/home/ubu/google-cloud-sdk/path.bash.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/home/ubu/google-cloud-sdk/completion.bash.inc' ]; then . '/home/ubu/google-cloud-sdk/completion.bash.inc'; fi

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/ubu/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/ubu/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/ubu/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/ubu/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<
