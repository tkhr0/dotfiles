#!/bin/bash

DOT_FILES=( bashrc zshrc agignore )
for file in ${DOT_FILES[@]}
do
  if [ -e $HOME/.$file ]; then
    ln -s `pwd`/$file $HOME/$file.dot
    echo "ファイルが存在します.dotファイル: $file"
  else
    ln -s `pwd`/$file $HOME/.$file
    echo "シンボリックリンクを貼りました: $file"
  fi
done


# neovim
echo "neovim"
CONFIG_DIR=${XDG_CONFIG_HOME:-$HOME/.config}
NVIM_CONFIG_DIR=$CONFIG_DIR/nvim
echo $NVIM_CONFIG_DIR
if ! [ -e $NVIM_CONFIG_DIR -o -L $NVIM_CONFIG_DIR ]; then
  ln -s `pwd`/nvim $NVIM_CONFIG_DIR
  echo "linked"
else
  echo "skipped"
fi

if ! which brew ; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew bundle
