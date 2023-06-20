#!/bin/zsh

# Git status for prompt
git_prompt() {

 if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    return
 fi 
  local git_prompt=""
  local git_status=$(git status --porcelain 2>/dev/null)
  local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  
 if [[ -n "$git_status" || ! "$(git diff --staged --quiet)" ]]; then    
    local untracked_icon="%{%{$fg[yellow]%}*%{$reset_color%}%}"
    local modified_icon="%{%{$fg[red]%}!%{$reset_color%}%}"
    local staged_icon="%{%{$fg[blue]%}+%{$reset_color%}%}"

    if [[ $git_status == *'??'* ]]; then
      git_prompt+="$untracked_icon"  # Untracked files
    fi
    if [[ $git_status == *'M'* ]]; then
      git_prompt+="$modified_icon"  # Modified files
    fi
    if ! git diff --cached --quiet; then
      git_prompt+="$staged_icon"  # Staged files
    fi
    git_prompt="%{$fg[green]%} ${git_prompt} %{$fg[green]%}%{$fg[green]%} ${branch}%{$reset_color%}"
  fi
  
  echo -n "$git_prompt"
}

function conda_env() {
  if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
    echo "%{$fg[grey]%}(${CONDA_DEFAULT_ENV})%{$reset_color%} "
  fi
}

autoload -Uz vcs_info
autoload -U colors && colors

zstyle ':vcs_info:*' enable git

precmd_vcs_info() {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    vcs_info
  fi
}

precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] &&
    git status --porcelain | grep '??' &>/dev/null; then
    hook_com[staged]+='!' # signify new files with a bang
  fi
}

zstyle ':vcs_info:*' check-for-changes true

RPROMPT='$(conda_env)%{$fg[grey]%}%D{%H:%M:%S}'

PROMPT="%{$fg[grey]%}%~%f \$(git_prompt) %{$reset_color%}"
PROMPT+='
❯ '

# Set up LSCOLORS for directory and file colors

typeset -A LS_COLORS
LS_COLORS[di]="$(echo -e "\033[1m")" # Bold directory
LS_COLORS[fi]="$(echo -e "\033[0m")" # Regular file
export LS_COLORS
