source ~/.bashrc

powerline-daemon -q
. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# findutil
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# asdf
. $(brew --prefix asdf)/asdf.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/lib/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/lib/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/lib/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/lib/google-cloud-sdk/completion.zsh.inc'; fi
# rust
export PATH="$HOME/.cargo/bin:$PATH"

######################################## 
# 少し凝った zshrc
# License : MIT
# http://mollifier.mit-license.org/
########################################
# 環境変数
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
#PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~
#%# "


# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完

#for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# 補完機能を有効にする
autoload -Uz compinit
compinit -u

# kubectl completion
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

# helm completion
if [ $commands[helm] ]; then
  source <(helm completion zsh)
fi


# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス

alias ls='ls -G'
alias la='ls -a'
alias ll='ls -la'
alias lla='ls -al'

alias rm='rm -i'

alias mkdir='mkdir -p'

alias du='du -h'

alias tree='tree -NC'

alias grep='grep --color=auto --label=stdin'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# deployer
alias deploy='dep deploy -vvv'

alias dcom='docker-compose'
alias dm='docker-compose'
alias kl='kubectl'
alias kx='kubectx'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

# vim:set ft=zsh:

#########################################
# cd 後にls
function chpwd(){ ls -la}

# iTerm2のタブ名を変更
function title {
    echo -ne "\033]0;"$*"\007"
}

#########################################
# finderの隠しファイルトグル
alias dotshow='killall finder; defaults write com.apple.finder AppleShowAllFiles -boolean true'
alias dothide='killall finder; defaults delete com.apple.finder AppleShowAllFiles'

#########################################
# lsの色変更
export LSCOLORS=gxfxcxdxbxegedabagacad

#########################################
# Git Aliases
#########################################
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gap='git add -p'
alias gb='git branch'
alias gbd='git branch -d '
alias gc='git commit'
alias gcm='git commit -m'
alias gcw='git commit -m WIP'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias gl='git log --pretty=full'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --progress'
alias gp='git pull'
alias gph='git push'
alias gpho='git push origin'
alias gs='git status'
alias gss='git status -s'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gf='git fetch -v --progress'
alias gfa='git fetch --all --prune -v --progress'
alias gfu='git fetch --prune -v --progress upstream'
alias grb='git rebase'
alias grbi='git rebase -i --autosquash'
alias gcp='git cherry-pick'
alias gcpc='git cherry-pick --continue'

# ----------------------
# Git Function
# ----------------------
# Git log find by commit message
function glf() { git log --all --grep="$1"; }

# ----------------------
# git-foresta
# https://github.com/takaaki-kasai/git-foresta
# ----------------------
function gifo() { git-foresta --style=10 "$@" | less -RSX }
function gifa() { git-foresta --all --style=10 "$@" | less -RSX }
compdef _git gifo=git-log
compdef _git gifa=git-log

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/karasawa/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/karasawa/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/karasawa/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/karasawa/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
