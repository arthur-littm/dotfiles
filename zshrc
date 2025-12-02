ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
# ZSH_THEME="robbyrussell"  # Disabled in favor of Starship prompt
ZSH_THEME=""  # Use empty theme for Starship

# Useful plugins for Rails development with Sublime Text
plugins=(git gitfast last-working-dir common-aliases sublime zsh-syntax-highlighting history-substring-search)

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)

# Better history search and management
export HISTSIZE=100000
export SAVEHIST=100000
setopt EXTENDED_HISTORY          # Write timestamp to history
setopt HIST_IGNORE_ALL_DUPS      # Delete old duplicates
setopt HIST_FIND_NO_DUPS         # Don't show duplicates in search
setopt SHARE_HISTORY             # Share history between sessions
setopt HIST_IGNORE_SPACE         # Don't save commands starting with space

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=/opt/homebrew/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Setup fzf (fuzzy finder) if installed
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"
export PATH="/opt/homebrew/opt/node@14/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/node@14/bin:$PATH"

# Added by Windsurf
export PATH="/Users/arthurlittman/.codeium/windsurf/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/arthurlittman/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# Initialize Starship prompt (must be at the end)
eval "$(starship init zsh)"
