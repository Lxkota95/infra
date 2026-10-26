alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# eza: like ls, with git status, icons, and tree view. Plain `ls` is left untouched.
if command -v eza >/dev/null; then
    alias el='eza -la --git --icons --group-directories-first'
    alias et='eza --tree --icons --git-ignore'
fi

# Notify when a long-running command finishes:  sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
