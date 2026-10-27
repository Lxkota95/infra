# grep → ripgrep for plain searches: `grep foo`, `grep foo file`, `cmd | grep foo`. ripgrep's flags
# differ from grep's (-r is *replace*, -E is *encoding*), so any flag falls back to the real grep,
# keeping `grep -rn`, `grep -E` etc. working as always. Use `rg` directly for ripgrep's own flags.
# Caveat: ripgrep uses Rust regex syntax, so alternation is `a|b`, not grep's `a\|b`.
# Interactive shells only; scripts keep /usr/bin/grep.
#
# .bashrc's `alias grep='grep --color=auto'` would shadow the function (aliases win), and bash expands
# aliases while *parsing*, so the unalias must run on its own line before the function is read, and
# `function grep` (whose name isn't alias-expanded) is used instead of `grep()`.
command -v rg >/dev/null && unalias grep 2>/dev/null
if command -v rg >/dev/null; then
    function grep {
        local arg
        for arg in "$@"; do
            case $arg in
            -*)
                command grep --color=auto "$@"
                return
                ;;
            esac
        done
        rg "$@"
    }
fi
