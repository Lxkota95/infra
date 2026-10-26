# ~/.bashrc: executed by bash(1) for interactive non-login shells.
# Managed by stow from ~/repos/lxkota/dotfiles/bash. Tool-specific setup lives
# in ~/.bashrc.d/*.sh; each file must be safe to source when its tool is absent.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History: large, deduplicated, appended (not overwritten) across shells
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=100000
HISTFILESIZE=200000
HISTTIMEFORMAT='%F %T  '
shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Prompt: user@host:dir (git-branch)$
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $(parse_git_branch)\$ '

# Set the terminal title to user@host: dir
case "$TERM" in
xterm*|rxvt*|foot*|alacritty*|tmux*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
esac

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Per-tool configuration
if [ -d ~/.bashrc.d ]; then
    for f in ~/.bashrc.d/*.sh; do
        [ -r "$f" ] && . "$f"
    done
    unset f
fi
