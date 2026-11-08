# Security policy

## Reporting a vulnerability

Please report vulnerabilities **privately** through GitHub: open the repository's **Security** tab
and choose **Report a vulnerability** (private vulnerability reporting). Do not open a public issue
or pull request for a suspected vulnerability.

Include what you found, how to reproduce it, and what you think the impact is. You will get an
acknowledgement within a few days. This is a volunteer-run showcase project, so there is no formal
response-time guarantee, but reports are taken seriously and credited if you wish.

## Scope

In scope:

- Code, workflows and configuration in the repositories of the `homelab-selfuryon` organization:
  reusable workflows, the CUE schema and renderer, platform component definitions, OpenTofu code,
  Renovate preset.
- Anything that would let a workflow, a pull request or a tenant escape the controls described in
  [`meta/security-baseline.md`](https://github.com/homelab-selfuryon/meta/blob/main/security-baseline.md)
  (for example forging a signing identity, or reading another tenant's secrets).

Out of scope:

- The homelab infrastructure itself (hosts, network, DNS): it is not a service offered to others.
- Findings in third-party dependencies with no demonstrated impact here; report those upstream.
- Denial of service through volume, social engineering, and automated scanner output without a
  demonstrated issue.

## No bounty

There is no bug bounty. Reports are appreciated and will be credited in the fix, nothing more.

## Supported versions

Only the latest release of each repository (or its default branch, where there are no releases) is
supported.
