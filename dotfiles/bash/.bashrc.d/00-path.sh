# User binaries: ~/.local/bin (Ubuntu's ~/.profile only adds it if it existed at login),
# cargo install (~/.cargo/bin) and go install (~/go/bin). Reverse order so ~/.local/bin is first.
for dir in "$HOME/go/bin" "$HOME/.cargo/bin" "$HOME/.local/bin"; do
    case ":$PATH:" in
        *":$dir:"*) ;;
        *) [ -d "$dir" ] && PATH="$dir:$PATH" ;;
    esac
done
unset dir
