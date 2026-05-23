#!/bin/zsh

set -eux

# ---------------------------------------------------------------------
# symbolic link
# ---------------------------------------------------------------------
DOT_FILES=(alacritty.toml gitconfig tmux.conf zshrc vimrc)
  
for file in ${DOT_FILES[@]}; do
  ln -nfs $HOME/dotfiles/${file} $HOME/.${file}
done
  
# ---------------------------------------------------------------------
# vim plugin
# ---------------------------------------------------------------------
cmd="sh ./vimplugins.sh"
eval $cmd

cmd="git clone https://github.com/arch4e/vpm.git $HOME/vpm"
eval $cmd

cmd="chmod +x ./$HOME/vpm/vpm.sh"
eval $cmd

cmd="./$HOME/vpm/vpm.sh"
eval $cmd


# ---------------------------------------------------------------------
# tools
# ---------------------------------------------------------------------
if [ "$(uname)" == 'Darwin' ]; then
  # macOS
  cmd='brew install ffmpeg gibo git git-lfs n rsync tmux tree wget'
  eval $cmd
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  # Linux
  cmd='sudo apt install bat httpie tmux tree'
  eval $cmd

  cmd='curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh'
  eval $cmd
else
fi

# ---------------------------------------------------------------------
# message
# ---------------------------------------------------------------------
cat << END

**************************************************
All settings are completed.
**************************************************
 
END

