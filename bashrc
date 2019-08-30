export XDG_CONFIG_HOME=$HOME/.config

# alias
alias la="ls -a"
alias vi="nvim"

# original script
export PATH=~/bin:$PATH
# gcloud
export PATH=/usr/local/lib/google-cloud-sdk/bin:$PATH
# golang
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

# rbenv
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PYENV_VERSION="2.7.13"

# ctags
alias ctags="`brew --prefix`/bin/ctags"

# fzf
export FZF_DEFAULT_COMMAND='ag --hidden --filename-pattern ""'
export FZF_DEFAULT_OPTS='--inline-info --reverse --preview "head {}"'
