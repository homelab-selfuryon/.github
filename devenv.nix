{ pkgs, ... }:
{
  packages = with pkgs; [
    actionlint
    renovate
    zizmor
  ];

  # `treefmt` formats the tree; the git hook runs it on commit.
  treefmt = {
    enable = true;
    config.programs = {
      nixfmt.enable = true;
      prettier = {
        enable = true;
        includes = [
          "*.json"
          "*.md"
          "*.yaml"
          "*.yml"
        ];
        excludes = [ "LICENSE" ];
      };
    };
  };
  git-hooks.hooks.treefmt.enable = true;
}
