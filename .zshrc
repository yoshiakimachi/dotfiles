# 環境変数
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# 基本設定
autoload -U compinit; compinit
setopt auto_cd # ディレクトリだけでcd
setopt auto_pushd # cdした先をディレクトリスタックに追加
setopt pushd_ignore_dups # ディレクトリスタックの重複除去
setopt hist_ignore_dups # ヒストリの重複除去
setopt hist_ignore_space # スペースで始まるコマンドをヒストリに追加しない
setopt nobeep # ビープを鳴らさない
zstyle ':completion:*:default' menu select=1 # Tabでパス名補完後Tab,Ctrl-N,Ctrl-Pで選択
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
setopt prompt_subst
autoload -Uz vcs_info
zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" stagedstr "!"
zstyle ":vcs_info:git:*" unstagedstr "+"
zstyle ":vcs_info:git:*" formats "[%b%c%u]"
zstyle ":vcs_info:git:*" actionformats "[%b|%a%c%u]"
precmd () { vcs_info }
PROMPT="%F{blue}%n@%m\${vcs_info_msg_0_}%#%f "

# エイリアス
alias l="ls -F"
alias ll="ls -lF"
alias la="ls -laF"
alias rm='rm -i'
alias p="pwd"
alias grep="grep --color -n"
alias tree="tree -N" # N: 文字化け対策
alias gs='git status'
alias gl='git log --graph'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
#hash -d hoge=/long/path/to/hogehoge

# パス
typeset -U path cdpath fpath manpath
path=(
    $HOME/bin(N-/)
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    $path
)
