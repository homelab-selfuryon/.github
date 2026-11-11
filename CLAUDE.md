# .github

The org-wide `.github` repository of `homelab-selfuryon`. Not code: files GitHub applies to every
repository without its own copy.

## Layout

- `profile/README.md` — org profile page. Keep the repository table in step with `meta/README.md`.
- `SECURITY.md`, `CONTRIBUTING.md`, `.github/pull_request_template.md`,
  `.github/ISSUE_TEMPLATE/` — default community health files (inherited by repos that lack their own).
- `default.json` — the shared Renovate preset, used as `local>homelab-selfuryon/.github`. Repositories
  extend it from their `.github/renovate.json` and add only repo-specific rules. It holds the custom regex
  managers for `cue.mod/module.cue` deps, devenv inputs and `DEVENV_VERSION`.
- `.github/workflows/ci.yaml` — validates the preset, actionlint, zizmor; job `final-check` is the
  required check.

## Commands

```sh
devenv shell -- renovate-config-validator default.json .github/renovate.json
devenv shell -- actionlint
devenv shell -- zizmor .github/workflows
```

## Conventions

- Conventional Commits (`!` for breaking), signed commits. A change to `default.json` affects every
  repository on its next Renovate run: keep it minimal and validated.
- Public repository: no secrets, no real hosts, IPs or e-mail addresses.
- Workflows: actions pinned by SHA, top-level `permissions: {}`, no `${{ }}` in `run:`.
- Context for agents lives in the workspace `meta/` (not part of this repository).
