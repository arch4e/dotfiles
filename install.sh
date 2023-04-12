#!/bin/zsh

set -eux

### symbolic link ###
DOT_FILES=(.alacritty.yml .gitconfig .tmux.conf .zpreztorc .zshrc .vimrc)
  
for file in ${DOT_FILES[@]}; do
  ln -nfs $HOME/dotfiles/$file $HOME/$file
done
  
### prezto ###
cmd='git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"'
eval $cmd

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

if [ ! -e "$HOME/.local" ]; then
  cmd="mkdir $HOME/.local/"
fi

### vim plugins ###
cmd="sh ./vimplugins.sh"
eval $cmd

### vpm ###
cmd="git clone https://gitlab.com/noiv/vpm.git $HOME/vpm"
eval $cmd
cmd="chmod +x ./$HOME/vpm/vpm.sh"
eval $cmd
cmd="./$HOME/vpm/vpm.sh"
eval $cmd

### gibo ###
cmd="git clone https://github.com/simonwhitaker/gibo.git $HOME/.local/gibo"
eval $cmd

### fzf ###
cmd="git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.local/fzf && $HOME/.local/fzf/install --all"
eval $cmd

### z ###
cmd="git clone https://github.com/rupa/z $HOME/.local/z"
eval $cmd

if [ "$(uname)" == 'Darwin' ]; then
  # macOS
  cmd='brew install bat ffmpeg gibo git git-lfs httpie jq n radare2 rsync rust tmux tree wget'
  eval $cmd
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  # Linux
  cmd='sudo apt install bat httpie tmux tree'
  eval $cmd

  cmd='curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh'
  eval $cmd
else
fi

# End Msg.
cat << END

**************************************************
All settings are completed.
**************************************************
 
END
