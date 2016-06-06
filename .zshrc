export ZSH=/Users/michaelklein/.oh-my-zsh

bindkey -v

ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_COLOR_SCHEME='dark'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode battery time)
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='240'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='42'
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='245'

POWERLEVEL9K_DIR_HOME_BACKGROUND='028'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='029'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='029'

POWERLEVEL9K_BATTERY_LOW_BACKGROUND='124'
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='130'
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='059'
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND='255'

POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='235'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='235'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='250'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='250'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)

# Allow switching to normal mode fast (may cause issues with some plugins)
export KEYTIMEOUT=1

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/libexec/llvm-3.8/bin:/opt/X11/bin:/Library/TeX/texbin:/Users/michaelklein/Library/Haskell/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# enter twice on blank line reruns previous command
magic-enter () {
        if [[ -z $BUFFER ]]
        then
          if [ $num_back -eq 0 ]
          then
            zle up-history
          else
            eval "$(eval "fc -l -$num_back | sed 's/^ [0-9]*  //' | awk '{print}' ORS=' && '")true"
            let num_back=0
            zle accept-line
          fi
        else
          zle accept-line
        fi
}
zle -N magic-enter
bindkey "^M" magic-enter


# number of commands back to execute
num_back=0

# tab on blank allows executing the last n commands
function magic-tab() {
    if [[ $#BUFFER == 0 ]]
      then
        if [ $num_back -eq 0 ]
          then
            echo "<Cr> to execute the following commands or <Tab> to fetch another command:"
        fi
        let num_back=num_back+1
        echo "$(eval "fc -l -$num_back | head -n 1 | sed 's/^ [0-9]*  //'")"
    else
        zle expand-or-complete
    fi
}
zle -N magic-tab
bindkey '^I' magic-tab
