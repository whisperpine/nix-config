{ pkgs, ... }:
{
  imports = [
    ./base.nix

    ./erdtree
    ./direnv
    ./zellij
    ./lazygit
    ./pixi
  ];

  home.packages = with pkgs; [
    # cloud
    kubernetes-helm
    kubectl
    awscli2

    # dev tools
    python312
    uv

    # utilities
    translate-shell
    onefetch
    ffmpeg
    tokei
    just
  ];
}
