#!/bin/zsh

set -u

### Symbolic Link ###
echo "## Symbolic Link ##"

DOT_FILES=(.gitconfig .zpreztorc .zshrc .vimrc)
  
for file in ${DOT_FILES[@]}; do
  ln -nfs $HOME/dotfiles/$file $HOME/$file
done
  
cat << MSG
  
--------------------------------------------------
  DOTFILES SETUP FINISHED!
--------------------------------------------------
 
MSG

### prezto ###
echo "## prezto ##"

cmd='git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"'
eval $cmd

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

if [ ! -e {i$HOME/.local} ]; then
  cmd="mkdir $HOME/.local/"
fi

### Vim Plugins ###
cmd="sh ./vimplugins.sh"
eval $cmd

### vpm ###
cmd="git clone https://gitlab.com/noiv/vpm.git $HOME/vpm"
eval $cmd
cmd="chmod +x ./$HOME/vpm/vpm.sh"
eval $cmd
cmd="./$HOME/vpm/vpm.sh"
eval $cmd


### Rust ###
cmd="curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
eval $cmd

### bat ###
cmd="cargo install --locked bat"
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

# End Msg.
cat << END

**************************************************
ALL SETUP FINISHED!
**************************************************
 
END
