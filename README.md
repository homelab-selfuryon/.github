# .github

Organization-wide defaults for [`homelab-selfuryon`](https://github.com/homelab-selfuryon): the org
profile, default community health files, and the shared Renovate preset. Documentation of the whole
system lives in [`meta`](https://github.com/homelab-selfuryon/meta).

| Path                                                          | Purpose                                        |
| ------------------------------------------------------------- | ---------------------------------------------- |
| `profile/README.md`                                           | Shown on the organization page.                |
| `SECURITY.md`, `CONTRIBUTING.md`                              | Defaults for every repository without its own. |
| `.github/ISSUE_TEMPLATE/`, `.github/pull_request_template.md` | Default issue and PR templates.                |
| `default.json`                                                | Renovate preset.                               |

## Renovate preset

Every repository's `.github/renovate.json`:

```json
{
  "$schema": "https://docs.renovatebot.com/renovate-schema.json",
  "extends": ["local>homelab-selfuryon/.github"]
}
```

The preset: starts from `config:best-practices`; pins GitHub Actions and reusable workflows by digest;
automerges minor, patch and digest updates once required checks pass (0.x minors are treated as
breaking and wait for a person); waits 3 days after a release (`minimumReleaseAge`) except for
security fixes; raises OSV vulnerability alerts; refreshes `Cargo.lock` weekly;
uses Conventional Commit messages (`chore(deps): ...`).

Custom managers:

- `cue.mod/module.cue`: `"github.com/homelab-selfuryon/<repo>@v0": { v: "vX.Y.Z" }` is looked up in the
  GitHub tags of `homelab-selfuryon/<repo>`.
- `registry/latest.json` (in `platform-components`): entries of the form
  `name`, `datasource`, `package`, optional `registry`, `version`.

Note: the preset is referenced with `local>`, so the Renovate app needs access to this repository.
The workflows and CUE modules of the org are public, so no extra credentials are involved.

## Development

```sh
devenv shell     # renovate, actionlint, zizmor
renovate-config-validator default.json .github/renovate.json
```

Licensed under Apache-2.0.
