if which ruby ; then
  gem install --no-doc solargraph rubocop rubocop-performance rubocop-rails rubocop-rspec neovim ec2ssh
fi

if which cargo ; then
  cargo +nightly install racer
  rustup component add rls-preview rust-analysis rust-src
fi
