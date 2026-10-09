{ pkgs, ... }:
{
  imports = [
    ./base.nix

    ./skills # skills for coding agents
    ./vercel-skills # manage agent skills
    ./duckdb # OLAP embedded database
    ./tealdeer # fast tldr implementation
    ./direnv # manage dir-based env vars
    ./zellij # terminal multiplexer
    ./opencode # ai coding agent
    ./lazygit # tui for git
    ./bun # toolkit for js and ts
    ./cargo # cargo configs
  ];

  home.packages = with pkgs; [
    # --- cloud --- #
    kubectl # kubernetes cli
    fluxcd # gitops for kubernetes

    # --- dev tools --- #
    python314 # python 13
    uv # python package manager
    kondo # clean unneeded files from projects
    hyperfine # command-line benchmarking tool
    onefetch # git repository summary

    # --- utilities --- #
    translate-shell # command-line translator
    pastel # play with colors in the terminal
    ffmpeg # process audio, image and video
    tokei # count code lines quickly

    # --- documents --- #
    pandoc # convert markup files
    pandoc-ext-diagram # generate diagrams
    mermaid-cli # the `mmdc` command
    librsvg # the `rsvg-convert` command to embed svg
    texliveSmall # tools like pdflatex
    ghostscript # manipulate pdf files
    qpdf # manipulate pdf files
  ];
}
