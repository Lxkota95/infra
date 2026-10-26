# Default editor for git, sudoedit, crontab -e, etc.
if command -v nvim >/dev/null; then
    export EDITOR=nvim VISUAL=nvim
fi
