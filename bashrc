# alias
alias la="ls -a"

# for original script
export PATH=~/bin:$PATH

# for pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export PYENV_ROOT=/usr/local/var/pyenv


export NVM_DIR="/Users/karasawa/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
