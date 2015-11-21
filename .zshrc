# -------------------------------------
# 環境変数
# -------------------------------------

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# エディタ
#export EDITOR=/usr/local/bin/vim

# ページャ
#export PAGER=/usr/local/bin/vimpager
#export MANPAGER=/usr/local/bin/vimpager


# -------------------------------------
# zshのオプション
# -------------------------------------

## 補完機能の強化
autoload -U compinit
compinit

## 入力しているコマンド名が間違っている場合にもしかして：を出す。
setopt correct

# ビープを鳴らさない
setopt nobeep

## 色を使う
setopt prompt_subst

## ^Dでログアウトしない。
#setopt ignoreeof

## バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

# 補完
## タブによるファイルの順番切り替えをしない
unsetopt auto_menu

# cd -[tab]で過去のディレクトリにひとっ飛びできるようにする
setopt auto_pushd

# ディレクトリ名を入力するだけでcdできるようにする
setopt auto_cd

# -------------------------------------
# パス
# -------------------------------------

# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

path=(
    $HOME/bin(N-/)
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    $path
)

# -------------------------------------
# プロンプト
# -------------------------------------

autoload -U promptinit; promptinit
autoload -Uz colors; colors
autoload -Uz vcs_info
autoload -Uz is-at-least

# begin VCS
zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:git:*" formats "(%s)-[%b]"
zstyle ":vcs_info:git:*" actionformats "(%s)-[%b|%a]"
zstyle ":vcs_info:git:*" max-exports 6
zstyle ":vcs_info:git:*" check-for-changes true # commitしていないのをチェック
zstyle ":vcs_info:git:*" stagedstr ":S"
zstyle ":vcs_info:git:*" unstagedstr ":U"
zstyle ":vcs_info:git:*" formats "[%b%c%u]"
zstyle ":vcs_info:git:*" actionformats "[%b|%a%c%u]"
# end VCS

precmd () { vcs_info }

#OK="^_^ "
#NG="X_X "

#PROMPT+="%(?.%F{green}$OK%f.%F{red}$NG%f) "
PROMPT="%F{green}%n@%m\${vcs_info_msg_0_}%f$ "
#PROMPT='${vcs_info_msg_0_}$ '

#RPROMPT="[%*]"

# -------------------------------------
# エイリアス
# -------------------------------------

# -n 行数表示, -I バイナリファイル無視, svn関係のファイルを無視
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

# ls
alias l="ls -ap" # color for darwin
alias ll="ls -lap"
#alias la="ls -la"
#alias l1="ls -1"

# pwd
alias p="pwd"

# tree
alias tree="tree -NC" # N: 文字化け対策, C:色をつける


# -------------------------------------
# キーバインド
# -------------------------------------

#bindkey -e
#
#function cdup() {
#   echo
#   cd ..
#   zle reset-prompt
#}
#zle -N cdup
#bindkey '^K' cdup
#
#bindkey "^R" history-incremental-search-backward

# -------------------------------------
# その他
# -------------------------------------

# cdしたあとで、自動的に ls する
#function chpwd() { ls -1 }

# iTerm2のタブ名を変更する
#function title {
#    echo -ne "\033]0;"$*"\007"
#}
