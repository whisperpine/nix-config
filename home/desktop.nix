{ pkgs, ... }:
{
  imports = [
    ./base.nix

    ./erdtree
    ./direnv
    ./zellij
  ];

  home.packages = with pkgs; [
    # tui
    lazygit

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
    tokei
    just
  ];
}
