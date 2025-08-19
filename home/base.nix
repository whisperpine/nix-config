{ pkgs, ... }:
{
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

  imports = [
    ./git
    ./bat
    ./zsh
    ./bash
    ./btop
    ./yazi
    ./nvim
    ./pgcli
    ./nushell
    ./starship
    ./zoxide
    ./atuin
  ];

  home.packages = with pkgs; [
    # manage itself
    home-manager

    docker-compose
    tree
    ouch
    eza

    sops
    age
  ];
}
