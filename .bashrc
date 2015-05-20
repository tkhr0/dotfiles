# alias
alias la="ls -a"

# for original script
export PATH=~/bin:$PATH

# for pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export PYENV_ROOT=/usr/local/var/pyenv

# for Homebrew php55
export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"

# for npm
export PATH="/usr/local/share/npm/bin:$PATH"

# for docker
export DOCKER_CERT_PATH=/Users/takahiro/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
eval "$(rbenv init -)"
