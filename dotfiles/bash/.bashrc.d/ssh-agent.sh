# Use the Bitwarden desktop app (snap) as the SSH agent when it is running.
# Keys live in the vault; nothing is stored in ~/.ssh.
if [ -S "$HOME/snap/bitwarden/current/.bitwarden-ssh-agent.sock" ]; then
    export SSH_AUTH_SOCK="$HOME/snap/bitwarden/current/.bitwarden-ssh-agent.sock"
fi
