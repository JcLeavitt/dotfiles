# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

ulimit -s 10240 -n 8192

# export GOBIN="/usr/local/go/bin/go"
export GOPATH="$HOME/go/bin"
export GO111MODULE=on
# # add go linter and formatter binaries to path
export PATH="$HOME/go/bin:$PATH"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jennings.leavitt/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jennings.leavitt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jennings.leavitt/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jennings.leavitt/google-cloud-sdk/completion.zsh.inc'; fi

export PS1='$(echo $KUBE)'" - $PS1"

PATH=${PATH}:~/.please/bin
source <(plz --completion_script)

export DOCKER_CONFIG=$HOME/.docker
export CLOUDSDK_CONFIG=$HOME/.config/gcloud

# Use case-sensitive completion.
CASE_SENSITIVE="true"

# Define how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Configure history stamp format
HIST_STAMPS="yyyy-mm-dd"


export KUBE_PATH="${HOME}/.kube"
source <(kubectl completion zsh)
alias k=kubectl
compdef __start_kubectl k
# Load Zsh tools for syntax highlighting and autosuggestions
HOMEBREW_FOLDER="/usr/local/share"
source "${HOMEBREW_FOLDER}/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${HOMEBREW_FOLDER}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


export COLORTERM=truecolor

plugins=(
  autojump
  bat
  bgnotify
  brew
  delta
  exa
  fzf
  git
  ispell
  lazygit
  macos
  node.js
  proselint
  ranger
  web-search
  write-good
  zoxide
  zsh-autosuggestions
  zsh-history-substring-search
  zsh-syntax-highlighting
)


export PATH="/usr/local/sbin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/zsh_completion" ] && . "$NVM_DIR/zsh_completion"  # This loads nvm bash_completion

# autoload -Uz compinit && compinit -C
# source <(wollemi completion zsh)
# compdef _wollemi wollemi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jennings.leavitt/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jennings.leavitt/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jennings.leavitt/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jennings.leavitt/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
source activate py3810
