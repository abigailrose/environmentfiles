# This function builds your prompt. It is called below
  function prompt {
    # Define the prompt character
    local   CHAR="♥"
    # ♥ ☆ - Keeping some cool ASCII Characters for reference

    # Here is where we actually export the PS1 Variable which stores the text for your prompt
    export PS1="$(scutil --get ComputerName) 🌸 \w:"
      PS2='> '
      PS4='+ '
    }

  # Finally call the function and our prompt is all pretty
  prompt

  # For more prompt coolness, check out Halloween Bash:
  # http://xta.github.io/HalloweenBash/

  # If you break your prompt, just delete the last thing you did.
  # And that's why it's good to keep your dotfiles in git too.

# Environment Variables
# =====================
  # Library Paths
  # These variables tell your shell where they can find certain
  # required libraries so other programs can reliably call the variable name
  # instead of a hardcoded path.
    export PATH=$PATH":$HOME/bin"
    # NODE_PATH
    # Node Path from Homebrew I believe
    export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

    # Those NODE & Python Paths won't break anything even if you
    # don't have NODE or Python installed. Eventually you will and
    # then you don't have to update your bash_profile

  # Configurations

    # GIT_MERGE_AUTO_EDIT
    # This variable configures git to not require a message when you merge.
    export GIT_MERGE_AUTOEDIT='no'

    # Editors
    # Tells your shell that when a program requires various editors, use sublime.
    # The -w flag tells your shell to wait until sublime exits
    export VISUAL="vim"
    export SVN_EDITOR="vim"
    export GIT_EDITOR="vim"
    export EDITOR="vim"

    # The USR_PATHS variable will just store all relevant /usr paths for easier usage
    # Each path is seperate via a : and we always use absolute paths.
    export USR_PATHS="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin"

    # Our PATH variable is special and very important. Whenever we type a command into our shell,
    # it will try to find that command within a directory that is defined in our PATH.
    export PATH="$USR_PATHS:$PATH"

    # If you go into your shell and type: echo $PATH you will see the output of your current path.
    # For example, mine is:
    # /Users/avi/.rvm/gems/ruby-1.9.3-p392/bin:/Users/avi/.rvm/gems/ruby-1.9.3-p392@global/bin:/Users/avi/.rvm/rubies/ruby-1.9.3-p392/bin:/Users/avi/.rvm/bin:/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/local/mysql/bin:/usr/local/share/python:/bin:/usr/sbin:/sbin:

# Helpful Functions
# =====================

# A function to CD into the desktop from anywhere
# so you just type desktop.
# HINT: It uses the built in USER variable to know your OS X username

# USE: desktop
#      desktop subfolder
function desktop {
  cd /Users/$USER/Desktop/$@
}

# A function to easily grep for a matching process
# USE: psg postgres
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}

# A function to extract correctly any archive based on extension
# USE: extract imazip.zip
#      extract imatar.tar
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      rar x $1        ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Aliases
# =====================
  # LS
  alias l='ls -lah'
  alias ls="ls | lolcat"
  alias sl="sl | lolcat"
  alias cat="lolcat"

  # Git
  alias gcl="git clone"
  alias ga="git add ."
  alias gst="git status | lolcat"
  alias gl="git pull | lolcat"
  alias gp="git push | lolcat"
  alias gd="git diff | subl"
  alias gc="git commit -v"
  alias gca="git commit -v -a"
  alias gb="git branch"
  alias gba="git branch -a"
  alias gcam="git commit -am"
  alias gbb="git branch -b"
  alias fish="asciiquarium"
  alias fishies="asciiquarium | lolcat"

  # Hidden File Visibility
  alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
  alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Case-Insensitive Auto Completion
  bind "set completion-ignore-case on" 
  
# Postgres
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

# Final Configurations and Plugins
# =====================
  # Git Bash Completion
  # Will activate bash git completion if installed
  # via homebrew
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi

  # RVM
  # Mandatory loading of RVM into the shell
  # This must be the last line of your bash_profile always
  [[ -s "/Users/$USER/.rvm/scripts/rvm" ]] && source "/Users/$USER/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# added by Anaconda3 5.0.1 installer
# export PATH="/Users/Abigail/anaconda3/bin:$PATH"  # commented out by conda initialize
#export PATH="/usr/local/opt/ruby/bin:$PATH"
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/abigail/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/abigail/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/abigail/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/abigail/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#i run on startup
conda deactivate
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
