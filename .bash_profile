export LSCOLORS="gxfxcxdxbxegedabagacad"
alias c='clear'
alias cd..='cd ..'
alias clr='clear'
alias ..='cd ..'
alias rm='rm -i'
alias ee="ssh evanPD333@luffy.ee.ncku.edu.tw"
alias v='vim'
alias add='git add -A'
alias commit='git commit -m'
alias push='git push'
alias pull='git pull'
alias checkout='git checkout'
alias web='cd ~/Documents/WebDesign'
alias evanhost='ssh -p 2016 evan@evangamehost.asuscomm.com'
export TERM="xterm-256color"
PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\033[01;34m\]\W\[\033[00m\]$(git_info)\[\033[00m\]\n\[\033[1;31m\]\$ \[\033[00m\]'

	# functions

function git_info {
ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
# Check for uncommitted changes in the index
if ! $(git diff --quiet --ignore-submodules --cached); then
    uc=" $(tput setaf 64)+"
fi

# Check for unstaged changes
if ! $(git diff-files --quiet --ignore-submodules --); then
    us=" $(tput setaf 124)!"
fi

# Check for untracked files
if [ -n "$(git ls-files --others --exclude-standard)" ]; then
    ut=" $(tput setaf 166)?"
fi

# Check for stashed files
if $(git rev-parse --verify refs/stash &>/dev/null); then
    st=" $(tput setaf 136)$"
fi

echo " ($(tput bold)${ref#refs/heads/}$uc$us$ut$st$(tput sgr0)$(tput setaf 254))";
# echo "(${ref#refs/heads/})";
}
