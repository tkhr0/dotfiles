export XDG_CONFIG_HOME=$HOME/.config
export GIT_EDITOR=nvim

# alias
alias la="ls -a"
alias vi="nvim"

# original script
export PATH=~/bin:$PATH

# ctags
alias ctags="`brew --prefix`/bin/ctags"

# fzf
export FZF_DEFAULT_COMMAND='ag --hidden --filename-pattern ""'
export FZF_DEFAULT_OPTS='--inline-info --reverse --preview "head {}"'

# ruby-build
export optflags="-Wno-error=implicit-function-declaration"
export LDFLAGS="-L$(brew --prefix libffi)/lib"
export CPPFLAGS="-I$(brew --prefix libffi)/include"
export PKG_CONFIG_PATH="$(brew --prefix libffi)/lib/pkgconfig"

. "$HOME/.cargo/env"
