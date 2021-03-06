# ~/.zshrc
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"
export PATH="$PATH:$HOME/.treetagger/cmd:$HOME/.treetagger/bin"

export VISUAL=vim
export EDITOR="$VISUAL"
export BROWSER=/opt/google/chrome/chrome


# ZSH_THEME="bira"
ZSH_THEME="agnoster"
DEFAULT_USER="t2"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"


# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


# alias hop="cd $HOME/fac/l3/hop3x; nohup sh H3Etudiant.sh > /dev/null 2>&1 &; cd ./hop3xEtudiant/data/"
alias c="printf '\e[3J\e[H'"
#alias c="clear && printf '\e[3J'"
alias ip='ifconfig | awk "/broadcast/ {print \$2}"'
alias ipp="curl ifconfig.co"
alias pl="swipl"
alias prolog="swipl"
alias :q=exit
alias :Q="shutdown 0"
alias clp="node ~/code/node/clips_wrapper/clips_wrap.js"
alias dp="termite &> /dev/null & disown"
alias open="xdg-open &> /dev/null"
alias vi="vim"
alias ivm="vim"
alias v="vim"
alias nano='vim'
alias vom="vim"
alias ls="lsd"
alias clip="xclip -rmlastnl -selection clipboard"
alias vg="node ~/vimgolf/play.js "
alias lastcmd="fc -lnr -1"



# alias grn="grep -Rn"
alias grnc="grep -Rn -C 3"

function grn() {
	grep -Rni --color=always $@ | awk -F: '{gsub(/\t+/, "", $3); printf "%s:%s:", $1, $2; for (i=3; i<=NF; i++) {printf "%s ", $i}; printf "\n"}' | column -s: -t
}
# grn --color=always TODO | awk -F: '{gsub(/^\t+|\t+$/, "", $3); print $1 ":" $2 ":" $3}'

bindkey -v


# ls after every cd
function list_all() {
    emulate -L zsh
    lsd
}
chpwd_functions=(${chpwd_functions[@]} "list_all")

# use treetagger to tag the arguments
function tag() {
	echo $@ | tree-tagger-french
}

# ssh

# ssh-agent setup
SSH_AGENT_ENV=~/.ssh/agent.env

# source the agent env
. $SSH_AGENT_ENV &> /dev/null

# if the env is inexistant or the agent is not alive anymore then make a new one
if [ "$(pidof ssh-agent)" != "$SSH_AGENT_PID" ]
then
	for pid in $(pidof ssh-agent); do kill -9 $pid; done;
	# create an agent
	ssh-agent > $SSH_AGENT_ENV
	. $SSH_AGENT_ENV &> /dev/null
	# see ssh config to automatically add key to the agent when unlocked
fi

