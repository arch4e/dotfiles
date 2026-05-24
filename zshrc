# ---------------------------------------------------------------------
# color
# ---------------------------------------------------------------------
autoload -Uz colors && colors

# ---------------------------------------------------------------------
# history
# ---------------------------------------------------------------------
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_NO_STORE             # Don't store history commands

# ---------------------------------------------------------------------
# pushd
# ---------------------------------------------------------------------
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# ---------------------------------------------------------------------
# path
# ---------------------------------------------------------------------
# /opt/homebrew/bin : Homebrew ( ARM )
# /opt/homebrew/sbin: Homebrew ( ARM )
# $HOME/.cargo/bin  : cargo (Rust)
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.cargo/bin:$PATH"

# ---------------------------------------------------------------------
# default editor
# ---------------------------------------------------------------------
export EDITOR=vim
export GIT_EDITOR=vim

# ---------------------------------------------------------------------
# prompt
# ---------------------------------------------------------------------
autoload -Uz vcs_info

setopt prompt_subst

export VIRTUAL_ENV_DISABLE_PROMPT=1

precmd() {
    vcs_info

    # ENV
    PYTHON_VIRTUAL_ENV_STRING=""
    if [ -n "$VIRTUAL_ENV" ]; then
        PYTHON_VIRTUAL_ENV_STRING="venv:`basename \"$VIRTUAL_ENV\"`"
    fi
}

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr   '%F{yellow}+%f'
zstyle ':vcs_info:git:*' unstagedstr '%F{red}!%f'
zstyle ':vcs_info:git:*' formats     '(%F{green}%b%f%c%u)'

# %~                 : current directory
# ${vcs_info_msg_0_} : git info
PROMPT='
%F{cyan}%~%f ${vcs_info_msg_0_} %F{246}${PYTHON_VIRTUAL_ENV_STRING}%f
%(?.%F{magenta}❯%f.%F{red}❯%f) '


# ---------------------------------------------------------------------
# feature
# ---------------------------------------------------------------------
# enable zmv
autoload -Uz zmv

# enable complement
autoload -Uz compinit && compinit

# enable menu selection mode
zstyle ':completion:*' menu select

# case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z Director-Z}={A-Z a-z}'

# color
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors "di=0;36"              # macOS

# ---------------------------------------------------------------------
# alias
# ---------------------------------------------------------------------
alias ls="ls --color=auto"
alias mmv='noglob zmv -W'
alias py="python3"
alias vi="vim"
alias vpm="~/vpm/vpm.sh"

