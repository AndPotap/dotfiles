alias alacritty="$HOME/alacritty/target/release/alacritty"
alias py='/ext3/miniconda3/bin/python3'
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

function findd {
    find . | grep -i ${@}
}
function BranchGit {
    echo "Branch named ${1}"
    git push origin HEAD:${1}
    git branch --set-upstream-to=origin/${1} ${1}
    git push --set-upstream origin ${1}
}
function sw {
    singularity shell --overlay /scratch/ap6604/overlayfs/${1}.ext3 /scratch/ap6604/greene.sif
}
function swnv {
    singularity shell --overlay /scratch/ap6604/overlayfs/${1}.ext3 --nv /scratch/ap6604/greene.sif
}
function srnv {
    singularity shell --overlay /scratch/ap6604/overlayfs/${1}.ext3:ro --nv /scratch/ap6604/greene.sif
}
function sr {
    singularity shell --overlay /scratch/ap6604/overlayfs/${1}.ext3:ro /scratch/ap6604/greene.sif
}
function sGPU {
    export CUDA_VISIBLE_DEVICES=${1}
    echo $CUDA_VISIBLE_DEVICES
}
function sto { tail -n100 -f "./slurm-${1}.out"; }
function slo { less "./slurm-${1}.out"; }

## Slurm aliases
# Requirements: runexec chmod +x ~/.local/bin/runexec
# Requirements: runwandb chmod +x ~/.local/bin/runwandb
# Example: HH=1 MEM=16 CPUS=1 ARRAY=1-4 swandb deeplearn/dummyMNIST/1qsc68iw
export OMP_NUM_THREADS=4
export WANDB_API_KEY=1acdbe06e1ba19e0c9dd6cb839baa5284745a413
export WANDB_USERNAME=andpotap
export SCRATCH="/scratch/ap6604"
export BLOBDIR="${SCRATCH}"
export OVERLAYFS=/scratch/ap6604/overlayfs/spurious.ext3:ro
export SIF=/scratch/ap6604/greene.sif
export LOGDIR=/home/ap6604/afr/logs

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
      ~/.local/bin/runexec "${@}"
}
function swandb {
    cd /home/ap6604/afr
  WANDB_SWEEP_ID=${1}
  if [[ -z "${WANDB_SWEEP_ID}" ]]; then
    echo "Missing sweep id."
    exit 1
  fi
  JOB_NAME=${WANDB_SWEEP_ID} slaunch runwandb ${@}
}
function swandb-gpu { GPUS="${GPUS:-1}" swandb "${@}"; }
