{ pkgs, ... }:
{
  imports = [
    ./base.nix

    ./erdtree
    ./direnv
    ./zellij
    ./lazygit
    ./bun
  ];

  home.packages = with pkgs; [
    # cloud
    kubectl
    ansible

    # dev tools
    python313
    uv

    # utilities
    translate-shell
    hyperfine
    onefetch
    ffmpeg
    kondo
    tokei
  ];
}
