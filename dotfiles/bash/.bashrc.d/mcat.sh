# cat → mcat: render markdown (and images) when printing to the terminal. Piped output stays plain
# text, so `cat file | grep` still works. mcat doesn't take cat's flags, so any flag (-n, -A, or
# "-" for stdin) falls back to the real cat. Interactive shells only; scripts keep /usr/bin/cat.
if command -v mcat >/dev/null; then
    function cat {
        local arg
        for arg in "$@"; do
            case $arg in
            -*)
                command cat "$@"
                return
                ;;
            esac
        done
        mcat "$@"
    }
fi
