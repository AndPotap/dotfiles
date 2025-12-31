alias alacritty="$HOME/alacritty/target/release/alacritty"
# alias py='/ext3/miniconda3/bin/python3'
alias py='python3'
# alias py='/usr/local/bin/python3'
alias vc='nvim /tmp/command.txt'
alias vi='nvim'
alias vim='nvim'
alias dot='cd ~/dotfiles'
alias rm='rm -I'
alias mv='mv -i'
alias c='clear'
alias ls='ls --color'
alias lsa='ls --color -a'
alias lst='ls --color -t'
alias lsl='ls --color -l'
alias sync='$HOME/bin/sync'
alias myip='curl ifconfig.me'

# Shortcuts to proyects
alias pro='cd ~/r-roulette-gps'
alias not='cd ~/notes && gp'
alias dot='cd ~/dotfiles'

# TMUX aliases
alias tls='tmux ls'
alias tkill='tmux kill-session -t'
alias tas='tmux attach-session -t'
alias tn='tmux new -s'
alias ta='tmux a'

# Linux only aliases
alias grep='grep --color=auto'
alias upd='sudo apt-get update -y && sudo apt-get upgrade -y'
alias shut='sudo shutdown -h now'
alias restart='sudo shutdown -r now'
alias pic='eog'

# Git aliases
alias gac='git add . && git commit'
alias gapp='git add . && git commit -m "Added" && git pull && git push'
alias gp='git pull'
alias gh='git push'
alias gpp='git pull && git push'
alias gs='clear && git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias grr='git reset --hard & git fetch --all & git pull'

# Computer specific aliases
# source $HOME/.bash_additional_aliases
alias sq='squeue -u ap6604'
alias randomGPU='export CUDA_VISIBLE_DEVICES=$((( RANDOM % 8 ))) && echo $CUDA_VISIBLE_DEVICES'
alias GPU='echo $CUDA_VISIBLE_DEVICES'
alias gsg='gpustat -cpu'
alias scra='cd /scratch/ap6604'
alias slogs="cd $LOGDIR"
alias save="source $HOME/.bash_profile"

function findd {
    find . | grep -i ${@}
}
function BranchGit {
    echo "Branch named ${1}"
    git push origin HEAD:${1}
    git branch --set-upstream-to=origin/${1} ${1}
    git push --set-upstream origin ${1}
}
function ExpandArXiv {
    # $1 = 2103.00020  # arXiv file
    # $2 = clip  # name of folder to create
    echo "Expanding arXiv source for paper ${2}"
    mkdir ${2}
    mv ${1} ${2}.tar
    mv ${2}.tar ${2}/
    cd ${2}/
    tar -xf ${2}.tar
    rm ${2}.tar
    cd ..
}
# export SIF=/scratch/ap6604/greene.sif
export SIF=/scratch/ap6604/greene_cu13.sif
function venv {
    source $HOME/venv/$1/bin/activate
    alias py=$HOME/venv/$1/bin/python3
}
function set_venv {
    echo "export VENV=${1}" > $HOME/venv/state.sh
}
function sw {
    singularity exec --overlay /scratch/ap6604/overlayfs/${1}.ext3 $SIF /bin/bash -l
}
function swnv {
    singularity exec --overlay /scratch/ap6604/overlayfs/${1}.ext3 --nv $SIF /bin/bash -l
}
function swnvb {
    singularity exec --overlay /scratch/ap6604/overlayfs/${1}.ext3 --bind /home/ap6604/tmp/ld.so.cache:/etc/ld.so.cache --nv $SIF /bin/bash -l
}
function srnv {
    singularity exec --overlay /scratch/ap6604/overlayfs/${1}.ext3:ro --nv $SIF /bin/bash -l
}
function sr {
    singularity exec --overlay /scratch/ap6604/overlayfs/${1}.ext3:ro $SIF /bin/bash -l
}
function srnvb {
    singularity exec --overlay /scratch/ap6604/overlayfs/${1}.ext3:ro --bind /home/ap6604/tmp/ld.so.cache:/etc/ld.so.cache:ro --nv $SIF /bin/bash -l
}
function sGPU {
    export CUDA_VISIBLE_DEVICES=${1}
    echo $CUDA_VISIBLE_DEVICES
}
function sto { tail -n100 -f "./slurm-${1}.out"; }
function slo { less "./slurm-${1}.out"; }

## Slurm aliases
# Requirements: runexec chmod +x ~/bin/runexec
# Requirements: runwandb chmod +x ~/bin/runwandb
# Example: HH=1 MEM=16 CPUS=1 GPUS=1 ARRAY=1-4 swandb deeplearn/dummyMNIST/1qsc68iw
# Example: HH=1 MEM=16 CPUS=1 GPUS=1 slaunch python3 run.py experiment=wt103/gpt2-monarch.yaml train.optimizer.lr=1.8e-3
# The next variables is what I need to modify for my projects
# export PROJECT_PATH=$HOME/fast_gen
# export LOGDIR=/scratch/ap6604/fast_gen/logs
# export OVERLAYFS=/scratch/ap6604/overlayfs/sparse.ext3:ro
export PROJECT_PATH=$HOME/data_generation
export LOGDIR=/scratch/ap6604/data_generation
export OVERLAYFS=/scratch/ap6604/overlayfs/data.ext3:ro

# export WANDB_API_KEY=1acdbe06e1ba19e0c9dd6cb839baa5284745a413
# export WANDB_USERNAME=andpotap
export WANDB_API_KEY=4d5eeaaa6c9490983c150734414d605e0c126b7a
export WANDB_USERNAME=ap3635
# export WANDB_API_KEY=6a47f093d2a55e4f4e85b33767423f2db66355b8
# export WANDB_USERNAME=alanamin
export SCRATCH="/scratch/ap6604"
export BINDING="/home/ap6604/tmp/ld.so.cache:/etc/ld.so.cache:ro"
export ACCOUNT="torch_pr_421_cilvr"
export BLOBDIR="${SCRATCH}"
export OMP_NUM_THREADS=2

function slaunch {
  if [[ ! -z "${GPUS}" ]]; then
    __GRES="--gres=gpu:${GPUS}"
  fi
  if [[ ! -z "${ACCOUNT}" ]]; then
    __ACCOUNT="--account=${ACCOUNT}"
  fi
  if [[ ! -z "${ARRAY}" ]]; then
    __ARRAY="--array=${ARRAY}"
  fi
  if [[ ! -z "${NODELIST}" ]]; then
    __NODELIST="--nodelist=${NODELIST}"
  fi
  sbatch --job-name=${JOB_NAME:-$(basename $(pwd))} ${__ACCOUNT} \
      --output="${LOGDIR}/slurm-%j.out" \
      --error="${LOGDIR}/slurm-%j.err" \
      ${__NODELIST} \
      ${__ARRAY} \
      ${__GRES} \
      --nodes=${NODES:-1} \
      --ntasks=${NODES:-1} \
      --cpus-per-task=${CPUS:-4} \
      --mem=${MEM:-16}G \
      --time=${HH:-16}:00:00 \
      ~/bin/runexec "${@}"
}
function swandb {
    cd $PROJECT_PATH
  WANDB_SWEEP_ID=${1}
  if [[ -z "${WANDB_SWEEP_ID}" ]]; then
    echo "Missing sweep id."
    exit 1
  fi
  JOB_NAME=${WANDB_SWEEP_ID} slaunch ~/bin/runwandb ${@}
}
function swandb-gpu { GPUS="${GPUS:-1}" swandb "${@}"; }
get_free_gpu() {
    # Get the list of GPU IDs to check, or default to all GPUs
    local IDs=${1:-$(nvidia-smi --query-gpu=index --format=csv,noheader,nounits | tr '\n' ' ')}

    for ID in $IDs; do
        MEM_USED=$(nvidia-smi --id=$ID --query-gpu=memory.used --format=csv,nounits,noheader)
        if [ "$MEM_USED" -lt 500 ]; then
            echo "$ID"
            return 0
        fi
    done

    sleep 10
    get_free_gpu "$IDs"
}
