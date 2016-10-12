# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source $HOME/.rvm/scripts/rvm

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate _extensions
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install


export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/libexec/llvm-3.8/bin:/opt/X11/bin:/Library/TeX/texbin:~/Library/Haskell/bin"
export PATH=~/perl5/bin:$PATH

export PERL5LIB=~/perl5/lib/perl5:$PERL5LIB


# alias vim=/usr/local/Cellar/vim/7.4.1830/bin/vim
alias vim=/usr/local/Cellar/vim/8.0.0022/bin/vim

# Make a directory (or path) using mkdir and cd into the last argument
mkcd() {
  command mkdir "$@" && cd "${@: -1}"
}

resetwifi() {
  command networksetup -setairportpower "$@" off && networksetup -setairportpower "$@" on
}

# enter on blank line reruns previous command
magic-enter () {
        if [[ -z $BUFFER ]]
        then
          if [ $num_back -eq 0 ]
          then
            zle up-history
          else
            eval "$(eval "fc -l -$num_back | sed 's/^[0-9 ]*//' | awk '{print}' ORS=' && '")true"
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
        echo "$(eval "fc -l -$num_back | head -n 1 | sed 's/^[0-9 ]*//'")"
    else
        zle expand-or-complete
    fi
}
zle -N magic-tab
bindkey '^I' magic-tab
