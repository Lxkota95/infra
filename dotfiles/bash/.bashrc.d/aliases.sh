alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Notify when a long-running command finishes:  sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
