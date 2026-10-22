# direnv: load/unload per-directory .envrc files (run `direnv allow` to trust one).
# Sourced last (zz-) so its prompt hook runs after other PROMPT_COMMAND changes.
if command -v direnv >/dev/null; then
    eval "$(direnv hook bash)"
fi
