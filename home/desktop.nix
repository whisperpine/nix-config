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

    # utilities
    python312
    translate-shell
    onefetch
    tokei
    just
  ];
}
