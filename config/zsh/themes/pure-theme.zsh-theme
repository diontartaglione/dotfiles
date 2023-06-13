#!/bin/zsh

autoload -Uz vcs_info
autoload -U colors && colors

zstyle ':vcs_info:*' enable git 

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})%{$reset_color%}"

function conda_env() {
  if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
    echo "%{$fg[grey]%}(${CONDA_DEFAULT_ENV})%{$reset_color%} "
  fi
}

RPROMPT='$(conda_env)%D{%H:%M:%S}'

PROMPT="%F{8}%~%f"
PROMPT+=' '
PROMPT+="\$vcs_info_msg_0_"
PROMPT+='
❯ '

# Set up LSCOLORS for directory and file colors

typeset -A LS_COLORS
LS_COLORS[di]="$(echo -e "\033[1m")" # Bold directory
LS_COLORS[fi]="$(echo -e "\033[0m")" # Regular file
export LS_COLORS
