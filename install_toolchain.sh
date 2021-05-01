if which ruby ; then
  gem install --no-doc solargraph rubocop rubocop-performance rubocop-rails rubocop-rspec neovim ec2ssh
fi

if which cargo ; then
  cargo +nightly install racer
  rustup component add rls-preview rust-analysis rust-src
fi

if which yarn ; then
  yarn global add typescript-language-server
fi

if which python; then
    python -m pip install --user flake8 autopep8
fi

# iTerm2
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
