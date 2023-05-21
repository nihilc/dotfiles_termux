#!/bin/zsh
autoload -Uz colors && colors -u
autoload -Uz vcs_info

# Format the vcs_info_msg_0_ variable
# ✔ ✘ ✚ ✖
zstyle ':vcs_info:*' enable git

theme_precmd () {
  if [[ -z $(git status -s 2> /dev/null) ]]; then
    zstyle ':vcs_info:git:*' formats '%F{02}%b ✔%f'
  else
    zstyle ':vcs_info:git:*' formats '%F{01}%b ✘%f'
  fi
  vcs_info
}

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd

# Format the prompt
# ┌ └ ─ │ ┤    
TM_NL=$'\n'
TM_DIR='%F{04}%2~%f'
TM_LU='%F{05}┌─┤ %f'
TM_LD='%F{05}└─>%f '
TM_SP='%F{05} │ %f'

setopt PROMPT_SUBST
PROMPT='${TM_LU}${TM_DIR}${TM_SP}${vcs_info_msg_0_}${TM_NL}${TM_LD}'
