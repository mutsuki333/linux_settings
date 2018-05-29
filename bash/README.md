# Bash settings

## Basic settings
**Color settings**
```shell
export LSCOLORS="gxfxcxdxbxegedabagacad"
```

**PS1 settings**
```shell
PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\033[01;34m\]\W\[\033[00m\]$(git_info)\[\033[00m\]\n\[\033[1;31m\]\$ \[\033[00m\]'
```


**Git status**
```shell
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
```

**read alias file**
```shell
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
```
**Setting the aliases in another file**
set `alias rm='rm -i'` to replace rm to avoide error removing
By using `$1`, `$2` to get paramaters or `$@` to get list
```shell
junk() {
    for item in "$@" ;
      do echo "Trashing: $item" ;
      mv "$item" ~/.Trash/;
    done;
}
```

## To make tab auto-completion case-insensitive in the terminal
```shell
# If ~./inputrc doesn't exist yet, first include the original /etc/inputrc so we don't override it
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi

# Add option to ~/.inputrc to enable case-insensitive tab completion
echo 'set completion-ignore-case On' >> ~/.inputrc
```
to make this change for all users, edit `/etc/inputrc`
