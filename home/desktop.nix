{ pkgs, ... }:
{
  imports = [
    ./base.nix

    ./erdtree
    ./direnv
    ./zellij
    ./lazygit
  ];

  home.packages = with pkgs; [
    # cloud
    kubernetes-helm
    kubectl
    awscli2

    # dev tools
    python313
    uv

    # utilities
    translate-shell
    onefetch
    ffmpeg
    kondo
    tokei
    just
  ];
}
