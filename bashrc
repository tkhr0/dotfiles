# alias
alias la="ls -a"

# for original script
export PATH=~/bin:$PATH
# gcloud
export PATH=/usr/local/lib/google-cloud-sdk/bin:$PATH
# golang
export PATH=$PATH:$(go env GOPATH)/bin

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


