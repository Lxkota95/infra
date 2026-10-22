# zoxide: `z <partial>` jumps to frequently used directories, `zi` picks with fzf
if command -v zoxide >/dev/null; then
    eval "$(zoxide init bash)"
fi
