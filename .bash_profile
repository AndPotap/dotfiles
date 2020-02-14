# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/andpotap/google-cloud-sdk/path.bash.inc' ]; then . '/Users/andpotap/google-cloud-sdk/path.bash.inc'; fi

# MacPorts Installer addition on 2019-10-22_at_16:21:59: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/andpotap/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/andpotap/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/andpotap/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/andpotap/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH=$PATH:/Users/andpotap/bin
export PATH="/Users/andpotap/anaconda3/bin:$PATH"
export PYTHONPATH=$PYTHONPATH:"/Users/andpotap/uncountable_repamtrick"
export PYTHONSTARTUP="$(python -m jedi repl)"
source ~/.bashrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/andpotap/google-cloud-sdk/path.bash.inc' ]; then . '/Users/andpotap/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/andpotap/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/andpotap/google-cloud-sdk/completion.bash.inc'; fi
