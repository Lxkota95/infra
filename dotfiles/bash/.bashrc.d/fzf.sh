# fzf key bindings and completion: Ctrl-R history, Ctrl-T files, Alt-C cd, **<Tab> completion
if command -v fzf >/dev/null; then
    eval "$(fzf --bash)"
    if command -v fd >/dev/null; then
        export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
    fi
    if command -v bat >/dev/null; then
        export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:200 {}'"
    fi
fi
