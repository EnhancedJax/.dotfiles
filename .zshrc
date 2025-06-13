fastfetch

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git zsh-autosuggestions fast-syntax-highlighting zsh-autocomplete)

# History settings
HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups

source $ZSH/oh-my-zsh.sh
source /opt/homebrew/Cellar/z/1.12/etc/profile.d/z.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
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

# tex
export PATH=/usr/local/texlive/2024/bin/universal-darwin:$PATH

# UV
export PATH="/Users/jax/.local/bin:$PATH"

# Added by Windsurf
export PATH="/Users/jax/.codeium/windsurf/bin:$PATH"

# React-native
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

eval "$(starship init zsh)"
function fcd {
  local dir
  dir=$(find . \( \
    -name ".git" -o \
    -name ".dotnet" -o \
    -name "debug" -o \
    -name "bin" -o \
    -name "obj" -o \
    -name ".idea" -o \
    -name ".fleet" -o \
    -name "node_modules" -o \
    -name "volumes" -o \
    -name ".terraform" -o \
    -name "Library" -o \
    -name "Pictures" -o \
    -name "Documents" -o \
    -name ".local" -o \
    -name ".nuget" -o \
    -name ".npm" -o \
    -name ".expo" -o \
    -name ".vscode" -o \
    -name ".rustup" -o \
    -name ".cargo" -o \
    -name ".quokka" -o \
    -name ".aws-sam" -o \
    -name "dist" -o \
    -name "build" -o \
    -name ".vscode-insiders" -o \
    -name "ios/Pods" -o \
    -name "android/app/.cxx" \
  \) -prune -false -o -type d -print | head -n 5000 | fzf --tmux 80%,50%)
  if [ -n "$dir" ]; then
    cd "$dir"
  fi
}

# export PATH="$HOME/.rbenv/bin:$PATH"
# export PATH="$HOME/.rbenv/shims:$PATH"
# eval "$(rbenv init -)"

# Custom aliases
alias zc="cursor ~/.zshrc -n"    # Quick edit zshrc in Cursor
alias gc="git checkout"    # Git checkout shorthand
alias gl="git pull"         # Git pull shorthand
alias gm="git merge"        # Git merge shorthand
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Alias for aichat --execute "..."
alias ax="aichat --execute"
# Use eza instead of ls for better file listing
alias ls="eza"

# Init fzf zsh
eval "$(fzf --zsh)"
# # Init zoxide
# eval "$(zoxide init zsh)"

# Prompt to continue tmux session if not already in tmux and in an interactive shell
if [[ -z "$TMUX" && $- == *i* ]]; then
  echo -n $'Not in tmux. Attach to a tmux session? (y/n): '
  read -k 1 tmux_choice
  echo
  if [[ $tmux_choice == [yY] ]]; then
    tmux attach || tmux
  fi
fi