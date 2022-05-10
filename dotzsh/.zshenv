# Ensure that the correct Conda python is seen before the system python versions
PATH="/usr/bin:/bin:/usr/sbin:/sbin"
export PATH

#  gcloud
function switch_context() {
    export KUBE=$1
    export CLOUDSDK_CONTAINER_CLUSTER=$2
    export CLOUDSDK_ACTIVE_CONFIG_NAME=$3
    export KUBECONFIG="${KUBE_PATH}/${KUBE}.conf"
    echo $KUBECONFIG
    [[ -n ${3} ]] && gcloud config configurations activate $3
}

#  GCloud aliases
alias syd='switch_context syd syd-1 syd'
alias lon='switch_context lon lon-1 lon'
alias bom='switch_context bom bom-1 bom'
alias staging='switch_context staging staging-1 staging'
alias dev='switch_context dev dev-1 dev'
alias yul='switch_context yul yul-1 yul'
alias cbf='switch_context cbf cbf-1 cbf'
alias cbf-ana='switch_context cbf-ana cbf-ana-1 cbf-ana'
alias chs='switch_context chs chs-1 chs'

# Neovim aliases
alias nv='nvim'
alias nvd='cd ~/.config/nvim'

# ls aliases
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -lahG'

# Neo cd aliases
alias neo='cd ~/Projects/neo'
alias pbcmn='cd ~/Projects/neo/protos/commons'
alias pbapiw='cd ~/Projects/neo/protos/api/v1alpha1/wfm'
alias pbwfm='cd ~/Projects/neo/protos/matrix/wfm/'
alias pywfm='cd ~/Projects/neo/services/wfm'
alias gowfm='cd ~/Projects/neo/services/wfm/wfm'
alias goapi='cd ~/Projects/neo/services/api'

# See all user processes aliases
alias psusr='ps -o user= -p '

# Reset shell alias
alias newsh='exec $SHELL -l'
