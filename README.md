# infra
My infrastructure as code: an Ubuntu 26.04 workstation built reproducibly with Ansible and GNU Stow,
and (later) home lab machines.

## Layout
| Path | What |
|---|---|
| `bootstrap.sh` | Entry point on a bare machine: installs git + Ansible, clones this repo, runs the playbook |
| `ansible/` | System state: roles for base tools, CLI, editor, toolchains, apps, security, backups, desktop (GNOME via dconf), repos |
| `dotfiles/` | Stow packages linked into `$HOME` by the `dotfiles` role (`--no-folding`) |
| `homelab/` | The original home lab playbook (a Raspberry Pi); to be folded into `ansible/` |

## Usage
Fresh machine (after the Bitwarden SSH agent and the GitHub key are set up):
```
./bootstrap.sh
```

Re-apply on an existing machine (sudo needs a password; every run is logged to
`~/.local/state/ansible/ansible.log`):
```
cd ~/repos/infra/ansible && ansible-playbook site.yml -K
```

Stow a single package by hand (options come from `dotfiles/.stowrc`):
```
cd ~/repos/infra/dotfiles && stow -v bash
```

## Principles
- Everything configured on the machine is captured here (Ansible for system state, Stow for
  dotfiles); nothing set by hand stays uncaptured.
- No secrets in the repo. Secrets live in Bitwarden; the GNOME keyring holds the ones automation needs.
- Release binaries are pinned by version and sha256; apt packages come from Ubuntu or vendor repos.

## History
Moved here on 2026-10-26 from a private repo, with history (paths filtered with `git filter-repo`).
PR numbers in the imported merge commits ("Merge pull request #N") refer to that repo, not this one.

## License
MIT
