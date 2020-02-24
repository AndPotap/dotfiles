export PATH=$PATH:/home/pure/bin
export PATH="/home/pure/anaconda3/bin:$PATH"
export PYTHONPATH=$PYTHONPATH:"/home/pure/igr"
export PYTHONPATH=$PYTHONPATH:"/home/pure/cbetadir"
export PYTHONSTARTUP="$(python -m jedi repl)"
source ~/.bashrc
