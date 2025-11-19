{ pkgs, ... }:
{
  imports = [
    ./base.nix

    ./tealdeer
    ./erdtree
    ./direnv
    ./zellij
    ./lazygit
    ./bun
  ];

  home.packages = with pkgs; [
    # --- cloud --- #
    kubectl

    # --- dev tools --- #
    python313
    uv

    # --- utilities --- #
    translate-shell
    hyperfine
    onefetch
    ffmpeg
    kondo
    tokei
  ];
}
