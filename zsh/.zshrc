cat << EOF
┌┬┐┌─┐  ┌─┐┌─┐┬┌─┐  ┌─┐┬ ┬┬┌┬┐
 │││ │  ├┤ ├─┘││    └─┐├─┤│ │
─┴┘└─┘  └─┘┴  ┴└─┘  └─┘┴ ┴┴ ┴
EOF

DATE=$(date +'20%y-%m-%d')
echo $DATE

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/nuiteq/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
plugins=(git)

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

source ~/.nvm/nvm.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/12/bin
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"

export PATH="$(brew --prefix qt5)/bin:$PATH"

export PATH=$PATH:/usr/local/go/bin/go
export PATH=$PATH:/Users/nuiteq/go/bin
export GO111MODULE=on

export EDITOR='vim'
alias mux="tmuxinator"

export PATH=$PATH:/Applications/MacVim.app/Contents/bin/

alias vim="mvim -v"
# Add Visual Studio Code (code)
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:/usr/local/opt/qt/bin:/usr/local/opt/qt/bin:/usr/local/lib/ruby/gems/2.7.0/bin:/usr/local/opt/ruby/bin:/usr/local/sbin:/usr/local/sbin:/usr/local/opt/qt/bin:/Users/nuiteq/.yarn/bin:/Users/nuiteq/.config/yarn/global/node_modules/.bin:/Users/nuiteq/.nvm/versions/node/v14.3.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/Applications/Postgres.app/Contents/Versions/12/bin:/usr/local/go/bin/go:/Users/nuiteq/go/bin:/Applications/MacVim.app/Contents/bin/"

alias md="mkdir"
alias cu="cd ../"

#enable color output - for lolcat
export CLICOLOR=1
export LSCOLORS=gx

#git alias
alias gsl='git status | lolcat'
alias gdl='git diff | lolcat'
alias gap='git add -p'

function cd() {
  builtin cd "$@" && ls -F | lolcat
}

alias ls='ls | lolcat'
alias xcode='open -a Xcode'

alias weather="curl wttr.in | lolcat"
alias lynx="lynx duckduckgo.com | lolcat"

# alias to open projects
alias cosfw="mux cosfw"
alias stage="mux stage"
alias rostersync="mux rostersync"
alias stageguide="mux stageguide"
