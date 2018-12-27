#!/bin/bash
CONFIG_DIR=${XDG_CONFIG_HOME:-$HOME/.config}

DOT_FILES=( vimrc tmux.conf bashrc zshrc)

for file in ${DOT_FILES[@]}
do
  if [ -e $HOME/.$file ]; then
    ln -s $HOME/dotfiles/$file $HOME/$file.dot
    echo "ファイルが存在します.dotファイル: $file"
  else
    ln -s $HOME/dotfiles/$file $HOME/.$file
    echo "シンボリックリンクを貼りました: $file"
  fi
done


# neovim
echo "neovim"
NVIM_CONFIG_DIR=$CONFIG_DIR/nvim
echo $NVIM_CONFIG_DIR
if ! [ -e $NVIM_CONFIG_DIR -o -L $NVIM_CONFIG_DIR ]; then
  ln -s $HOME/dotfiles/nvim $NVIM_CONFIG_DIR
  echo "linked"
else
  echo "skipped"
fi
