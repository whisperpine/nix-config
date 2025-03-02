{ pkgs, ... }:
{
  imports = [
    ./git
    ./zsh
    ./bash
    ./btop
    ./yazi
    ./nvim
    ./erdtree
    ./nushell
    ./starship
    ./direnv
    ./zellij
    ./marksman
  ];

  home.packages = with pkgs; [
    # manage itself
    home-manager

    # toolchain
    python312
    git-lfs
    clang

    # tui
    lazygit

    # cloud
    docker-compose
    kubectl
    awscli2

    # utilities
    translate-shell
    onefetch
    tokei
    tree
    just
    file
    unzip
    wget
    curl
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";
  home.enableNixpkgsReleaseCheck = false;
}
