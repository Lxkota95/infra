# Use the Bitwarden desktop app as the SSH agent when it is running.
# Keys live in the vault; nothing is stored in ~/.ssh.
# The .deb app listens on ~/.bitwarden-ssh-agent.sock; the snap used its own data directory.
for sock in "$HOME/.bitwarden-ssh-agent.sock" "$HOME/snap/bitwarden/current/.bitwarden-ssh-agent.sock"; do
    if [ -S "$sock" ]; then
        export SSH_AUTH_SOCK="$sock"
        break
    fi
done
unset sock
