#!/usr/bin/env bash
# Bootstrap a fresh Ubuntu machine: install git + ansible, clone this repo, run the playbook.
#   curl -fsSL <raw url of this file> | bash      (or run it from a clone)
# Cloning over SSH requires GitHub access first (Bitwarden SSH agent + key on GitHub).
set -euo pipefail

REPO_URL="${REPO_URL:-git@github.com:Lxkota95/infra.git}"
REPO_DIR="${REPO_DIR:-$HOME/repos/infra}"

sudo apt-get update
sudo apt-get install -y git ansible

if [ ! -d "$REPO_DIR/.git" ]; then
    mkdir -p "$(dirname "$REPO_DIR")"
    git clone "$REPO_URL" "$REPO_DIR"
fi

cd "$REPO_DIR/ansible"
ansible-playbook site.yml -K "$@"
