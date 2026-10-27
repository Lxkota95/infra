# infra — workstation (and home lab) as code

Reproducible setup for the user's Ubuntu workstation and future lab machines. Public repo.

- `bootstrap.sh` — entry point on a bare machine (installs git + ansible, clones, runs playbook).
- `ansible/` — system state. Run from `ansible/`: `ansible-playbook site.yml -K` (sudo needs a password).
  Every run is logged to `~/.local/state/ansible/ansible.log`; read its tail after the user runs the playbook.
- `dotfiles/` — stow packages, linked into `$HOME` by the `dotfiles` role (`.stowrc`: `--no-folding`).
- `homelab/` — the original Pi playbook; not yet part of `ansible/`.
- Planning notes, decisions and session logs live in the private `lxkota` repo
  (`~/repos/lxkota/docs/`: `roadmap.md` for open work, `work/` for decisions and session logs);
  update them as work completes.

Conventions:
- Capture every change in Ansible or stow before moving on; nothing configured by hand stays uncaptured.
- `main` is protected (PR required, no force-push/deletion): one branch + PR per change; the user merges.
- Files in `dotfiles/bash/.bashrc.d/` must be safe to source when their tool is not installed.
- No secrets in the repo (it's public). Secrets live in Bitwarden; automation reads them from the
  GNOME keyring (`secret-tool`).
- Facts are read via `ansible_facts[...]` only (`inject_facts_as_vars = False`); use `home_dir` for `~`.
