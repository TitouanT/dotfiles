# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
export PATH=$HOME/bin:$HOME/.treetagger/cmd:$HOME/.treetagger/bin:$PATH

export VISUAL=vim
export EDITOR="$VISUAL"

ZSH_THEME="agnoster"
DEFAULT_USER="t2"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"


# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"


# alias hop="cd $HOME/fac/l3/hop3x; nohup sh H3Etudiant.sh > /dev/null 2>&1 &; cd ./hop3xEtudiant/data/"
alias c="printf '\e[3J\e[H'"
#alias c="clear && printf '\e[3J'"
alias ip="ifconfig | grep -o '192\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,2\} '"
alias ipp="dig +short myip.opendns.com @resolver1.opendns.com"
alias pl="swipl"
alias prolog="swipl"
alias :q=exit
alias :Q="shutdown 0"
alias clp="node ~/code/node/clips_wrapper/clips_wrap.js"
alias dp="termite &> /dev/null & disown"
alias open="xdg-open &> /dev/null"
alias pv="vim -"
alias vi="vim"
alias ivm="vim"
alias v="vim"
alias vom="vim"
alias ls="lsd"
alias clip="xclip -rmlastnl -selection clipboard"

# ls after every cd
function list_all() {
    emulate -L zsh
    lsd -a
}
chpwd_functions=(${chpwd_functions[@]} "list_all")
