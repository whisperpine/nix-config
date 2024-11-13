{ pkgs-stable, ... }:
{
  home.packages = with pkgs-stable; [
    nodejs_22
  ];
}
