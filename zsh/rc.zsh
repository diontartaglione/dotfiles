
#----------------------Aliases-----------------------

source ~/.dotfiles/zsh/aliases.zsh

#----------------------Themes------------------------

ZSH_THEME_PATH="$HOME/.config/zsh/themes"

#----------------------TMUX--------------------------

# export TMUX_CONFIG="$HOME/.config/tmux/tmux.conf"

#----------------------Conda-------------------------

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/diontartaglione/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/diontartaglione/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/diontartaglione/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/diontartaglione/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#---------------------Rust---------------------------

source "$HOME/.cargo/env"

#---------------------FLUTTER------------------------ 

export PATH="$PATH:/Users/Shared/flutter/bin"

#---------------------ZSH----------------------------
# Case Insensitive Tab Completion: 
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Load zsh-completions
source ~/.config/zsh-completions/zsh-completions.plugin.zsh

# Load zsh-syntax-highlighting; should be last
source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Load zsh-autosuggestions
source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh

export TERM=xterm-256color
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $ZSH_THEME_PATH/pure-theme.zsh-theme



export PATH="/usr/local/texlive/2024basic/bin/universal-darwin:$PATH"

# JAVA VERSION
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0)


# ### Start Sketchybar
# brew services start sketchybar
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# bun completions
[ -s "/Users/diontartaglione/.bun/_bun" ] && source "/Users/diontartaglione/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
