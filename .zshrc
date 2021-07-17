cbonsai -pm "stay safe out there kid"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/george/.oh-my-zsh"
export GOPATH="/home/george/Go"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
plugins=(git z zsh-syntax-highlighting)

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
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# conda config --set auto_activate_base false
export VISUAL="/var/lib/snapd/snap/bin/nvim"
export EDITOR="$VISUAL"
export PYENV_ROOT="$HOME/.pyenv"

start_client_flask () {
  cd ~/Mighty/lemonade
  source venv/bin/activate
  source aws-creds.sh
  export FLASK_ENV='development'
  system/flask run
}
start_client_flask_prod () {
  cd ~/Mighty/lemonade
  source venv/bin/activate
  source aws-creds.sh
  export FLASK_ENV='development'
  system/flask run
}
start_client_yarn () {
  cd ~/Mighty/lemonade
  yarn install
  yarn start
}
start_api_flask () {
  cd ~/Mighty/lemonade-api
  source venv/bin/activate
  source aws-creds.sh
  export FLASK_ENV='development'
  system/flask run --port=9000
}

#needs work
alias start-frontend-server-only="start_client_flask"
alias start-frontend="(trap 'kill 0' SIGINT; start_client_flask & start_client_yarn)"
alias start-api='start_api_flask'
alias start-tunnel='ngrok http 127.0.0.1:5000 --hostname "*.mighty.george.ngrok.io" --region us'
alias start-api-tunnel='ngrok http 127.0.0.1:9000 --hostname=george-webhook.ngrok.io --region us'
alias start-webhook-tunnel='ngrok http 9000 --hostname=mighty-shopify-webhook.ngrok.io --region us'
alias start-browserstack-tunnel='ngrok http localhost:3000 --hostname "mighty.george.ngrok.io" --region us'
alias envkey='AppImageLauncher ~/Applications/EnvKey-1.4.18_2feb7fedfcb480c238bd357ae8eb8e36.AppImage &;disown;exit'
alias responsively='./Applications/ResponsivelyApp-0.15.0_f327bdf18c330e49a551b61853b45d95.AppImage '
alias spicetify="/home/george/spicetify-cli/spicetify"
alias nv="nvim"
alias n="nvim"
alias c="code ."
alias gbcurr="git branch --show-current"
alias br="git checkout \$(git branch | fzf)"
alias gpc="git push -u origin HEAD"
alias clock=" tty-qlock -off-color white -on-color magenta"


alias gecgecgec="spt play --artist --name "100 gecs""

alias box1="ssh george@ec2-54-221-59-146.compute-1.amazonaws.com"
alias box2="ssh george@ec2-3-239-207-183.compute-1.amazonaws.com"
alias box3="ssh george@ec2-54-156-149-20.compute-1.amazonaws.com"

alias coolguy="cd ~/Projects/Bad_Apple_frames && ./runrick.sh"
alias cooltree="cbonsai -S -m 'keep it real kid' -L 60"
alias game="~/Downloads/terranil/'Terra Nil.x86_64'"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/george/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/george/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/george/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/george/Downloads/google-cloud-sdk/completion.zsh.inc'; fi



path+="$PYENV_ROOT/bin:$PATH"
path+="$HOME/.cargo/bin"
path+="$HOME/Go"

