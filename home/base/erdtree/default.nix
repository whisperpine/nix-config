{
  pkgs ? import <nixpkgs> { },
  ...
}:
{
  home.packages = with pkgs; [
    erdtree
  ];

  home.file.".config/erdtree/.erdtree.toml" = {
    source = ./.erdtree.toml;
  };
}
