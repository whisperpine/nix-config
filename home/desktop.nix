{ pkgs, ... }:
{
  imports = [
    ./base.nix

    ./tealdeer # fast tldr implementation
    ./erdtree # file-tree visualizer
    ./direnv # manage dir-based env vars
    ./zellij # terminal multiplexer
    ./lazygit # tui for git
    ./bun # toolkit for js and ts
  ];

  home.packages = with pkgs; [
    # --- cloud --- #
    kubectl # kubernetes cli

    # --- dev tools --- #
    python313 # python 13
    uv # python package manager

    # --- utilities --- #
    translate-shell # command-line translator
    hyperfine # command-line benchmarking tool
    onefetch # git repository summary
    pastel # play with colors in the terminal
    ffmpeg # process audio, image and video
    kondo # clean unneeded files from projects
    tokei # count code lines quickly
  ];
}
