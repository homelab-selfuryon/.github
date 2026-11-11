# Contributing

Thanks for looking. These rules apply to every repository in the org unless it has its own
`CONTRIBUTING.md`.

## Development environment

Every repository has a devenv environment (`devenv.nix`). Do not install toolchains globally.

```sh
devenv shell        # or: direnv allow (each repository ships an .envrc)
```

Read the repository's `README.md` and `CLAUDE.md` for its build and test commands.

## Commits

- [Conventional Commits](https://www.conventionalcommits.org/): `feat:`, `fix:`, `docs:`,
  `chore:`, `refactor:`, `ci:` ... with an optional scope. Mark breaking changes with `!`
  (`feat(schema)!: ...`). Versions and changelogs are derived from them.
- **Commits must be signed** (GPG, SSH or S/MIME). Unsigned commits are rejected by the branch
  ruleset.
- Keep a pull request to one logical change.

## Pull requests

1. Fork or branch, and open a pull request against the default branch (`main`). Direct pushes to
   `main` are blocked.
2. The PR title must itself be a Conventional Commit: pull requests are squash-merged and the title
   becomes the commit message.
3. All required checks must pass (`final-check`). Workflow changes also run zizmor and actionlint.
4. A code owner (see `.github/CODEOWNERS`) reviews the change. History stays linear.
5. Do not commit secrets, credentials or real hostnames, IPs or e-mail addresses. Use placeholders
   such as `homelab.example` and `192.0.2.0/24`.
6. Write pull request descriptions, issues and comments without line breaks inside a paragraph:
   GitHub renders every newline there as a line break. One line per paragraph or list item, a blank
   line between paragraphs. (Markdown files in a repository may stay wrapped: GitHub joins their
   lines.)

## Workflows and dependencies

- Pin every GitHub Action by full commit SHA with a version comment; Renovate keeps the pins fresh.
- Never use `${{ }}` expressions inside `run:`; pass values through `env:`.
- No `pull_request_target` and no `workflow_run`.

## Reporting problems

Use the issue templates for bugs and feature requests. For vulnerabilities, follow
[SECURITY.md](SECURITY.md) instead.
