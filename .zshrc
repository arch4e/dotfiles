# prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_NO_STORE

# path
# /usr/local/sbin   : Homebrew (intel)
# /opt/homebrew/bin : Homebrew ( ARM )
# $HOME/.cargo/bin  : cargo (Rust)
export PATH="/usr/local/sbin:/opt/homebrew/bin:$HOME/.cargo/bin:$PATH"

# default Editor
export EDITOR=vim
export GIT_EDITOR=vim

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# z
. $HOME/.local/z/z.sh

# alias
alias py="python3"
alias gibo="$HOME/.local/gibo/gibo"
alias vi="vim"
alias vpm="~/vpm/vpm.sh"
