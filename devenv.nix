# Shared base (hooks, treefmt, actionlint, zizmor, shellcheck, jq) comes from platform-kit.
{ pkgs, ... }:
{
  packages = [ pkgs.renovate ];
}
