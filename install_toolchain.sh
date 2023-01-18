if which asdf ; then
  asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
  asdf plugin add python
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git 

  if ! which python; then
    asdf install python 3.7.11
  fi

  if ! which python2; then
    asdf install python 2.7.18
  fi

  if ! asdf current python; then
    asdf global python 3.7.11 2.7.18
  fi
fi

if which ruby ; then
  gem install --no-doc solargraph rubocop rubocop-performance rubocop-rails rubocop-rspec neovim ec2ssh
fi

if which cargo ; then
  cargo +nightly install racer
  rustup component add rls-preview rust-analysis rust-src
  rustup component add rls rust-analysis rust-src
fi

if which yarn ; then
  yarn global add typescript-language-server neovim
fi

if which python; then
  python -m pip install flake8 autopep8 neovim "python-language-server[all]" pyls-mypy
  asdf reshim python
fi

if which python2; then
  python2 -m pip install neovim
fi

# iTerm2
if ! [ -e ~/.iterm2_shell_integration.zsh ]; then
  curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
fi
