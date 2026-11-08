# homelab-selfuryon

A worked example of how a small company's **platform team** runs Kubernetes with **CUE** and secure
defaults, and how product teams (Rust only) ship onto it without an internal developer portal and
without Helm charts of their own.

Everything here is public and runs on a single-node homelab cluster. The point is the shape of the
system, not the scale: signed artifacts, identity instead of secrets, pull-based delivery, and a
paved road that is also the secure road.

**Start with [`meta`](https://github.com/homelab-selfuryon/meta)**: the delivery flow, the decisions
(and the options we rejected), and the security baseline.

## What it demonstrates

- A product team writes Rust and one `deploy.cue`; the platform renders everything else.
- Every artifact is built in CI, signed with cosign (keyless) and referenced by digest.
- Flux applies the platform, Argo CD syncs tenant apps, neither holds a long-lived credential.
- Secrets are files from OpenBao, authenticated by the pod's own ServiceAccount.
- GitHub settings and OpenBao policy are code, reviewed like any other change.

## Repositories

| Repository                                                                        | What it is                                                                             |
| --------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| [`meta`](https://github.com/homelab-selfuryon/meta)                               | Documentation: how the org fits together, delivery flow, decisions, security baseline. |
| [`.github`](https://github.com/homelab-selfuryon/.github)                         | This profile, community health files, the shared Renovate preset.                      |
| [`platform-terraform`](https://github.com/homelab-selfuryon/platform-terraform)   | OpenTofu for the GitHub org and OpenBao configuration.                                 |
| [`github-workflows`](https://github.com/homelab-selfuryon/github-workflows)       | Reusable workflows: build, sign, render, publish, promote.                             |
| [`platform-kit`](https://github.com/homelab-selfuryon/platform-kit)               | The paved road: CUE `#App` module and devenv module for Rust apps.                     |
| [`platform-components`](https://github.com/homelab-selfuryon/platform-components) | Clusters and platform components in CUE, released as signed OCI artifacts.             |
| [`gitops`](https://github.com/homelab-selfuryon/gitops)                           | What runs where: digests per cluster and environment.                                  |
| [`rust-app-template`](https://github.com/homelab-selfuryon/rust-app-template)     | Template for a new Rust app.                                                           |
| [`notes-api`](https://github.com/homelab-selfuryon/notes-api)                     | Example app: notes REST API on Postgres.                                               |
| [`notes-stats`](https://github.com/homelab-selfuryon/notes-stats)                 | Example app: calls `notes-api` with a projected ServiceAccount token.                  |

## Contributing

Issues and pull requests are welcome; see [CONTRIBUTING](https://github.com/homelab-selfuryon/.github/blob/main/CONTRIBUTING.md).
To report a vulnerability, follow [SECURITY](https://github.com/homelab-selfuryon/.github/blob/main/SECURITY.md).
