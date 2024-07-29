# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias tmx="tmux"
alias tks="tmux kill-session -t"
alias tsc="tmux switch-client -t"
alias tka="tmux kill-server"
alias tls="tmux ls"
alias tas="tmux a -t"
alias tns="tmux new -s"
alias tnd="tmux new -d -s"

function te() { echo "terraform $@"; terraform $@; }
function td() { echo "terraform destroy -auto-approve $@"; terraform destroy -auto-approve "$@"; }
function ta() { echo "terraform apply -auto-approve $@"; terraform apply -auto-approve "$@"; }
function ti() { echo "terraform init $@"; terraform init $@; }

function gpo() { echo "git push origin $@"; git push origin $@; }
function gc() { echo "git checkout $@"; git checkout $@; }
function gf() { echo "git fetch origin $@"; git fetch origin $@; }
function gcm() { echo "git commit -m \"$*\""; git commit -m "$*"; }
function gps() { echo "git push --set-upstream origin $@"; git push --set-upstream origin $@; }
function gp() { echo "git pull origin $@"; git pull origin $@; }
function gs() { echo "git status $@"; git status $@; }
function gb() { echo "git branch $@"; git branch $@; }
function gdel() { echo "git push origin --delete $@"; git push origin --delete $@; }
function ga() { echo "git add --all $@"; git add --all $@; }
function gfp() { echo "git fetch --prune $@"; git fetch --prune $@; }

check-alias() {
    case "$1" in
        --tmux)
            echo 'alias tmx="tmux"'
            echo 'alias tks="tmux kill-session -t"'
            echo 'alias tsc="tmux switch-client -t"'
            echo 'alias tka="tmux kill-server"'
            echo 'alias tls="tmux ls"'
            echo 'alias tas="tmux a -t"'
            echo 'alias tns="tmux new -s"'
            echo 'alias tnd="tmux new -d -s"'
            ;;
        --terraform)
            echo 'te() { echo "terraform $@"; terraform "$@"; }'
            echo 'td() { echo "terraform destroy -auto-approve $@"; terraform destroy -auto-approve "$@"; }'
            echo 'ta() { echo "terraform apply -auto-approve $@"; terraform apply -auto-approve "$@"; }'
            echo 'ti() { echo "terraform init $@"; terraform init "$@"; }'
            ;;
        --git)
            echo 'gpo() { echo "git push origin $@"; git push origin "$@"; }'
            echo 'gc() { echo "git checkout $@"; git checkout "$@"; }'
            echo 'gf() { echo "git fetch origin $@"; git fetch origin "$@"; }'
            echo 'gcm() { echo "git commit -m \"$*\""; git commit -m "$*"; }'
            echo 'gps() { echo "git push --set-upstream origin $@"; git push --set-upstream origin "$@"; }'
            echo 'gp() { echo "git pull origin $@"; git pull origin "$@"; }'
            echo 'gs() { echo "git status $@"; git status "$@"; }'
            echo 'gb() { echo "git branch $@"; git branch "$@"; }'
            echo 'gdel() { echo "git push origin --delete $@"; git push origin --delete "$@"; }'
	    echo 'function ga() { echo "git add --all $@"; git add --all $@; }'
	    echo 'function gfp() { echo "git fetch --prune $@"; git fetch --prune $@; }'
            ;;
        *)
            check-alias --tmux
            echo ''
            check-alias --terraform
            echo ''
            check-alias --git
            ;;
    esac
}

eval "$(zoxide init --cmd cd zsh)"

alias cat="bat"

eval $(thefuck --alias)
eval $(thefuck --alias fk)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
