export XDG_CONFIG_HOME=$HOME/.config
export GIT_EDITOR=nvim

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

# ctags
alias ctags="`brew --prefix`/bin/ctags"

# fzf
export FZF_DEFAULT_COMMAND='ag --hidden --filename-pattern ""'
export FZF_DEFAULT_OPTS='--inline-info --reverse --preview "head {}"'
