{ config, pkgs, pkgs-stable, ... }:

{
  imports = [
    ./neovim
    ./erdtree
    ./nushell

    ./git.nix
    ./bash.nix
    ./btop.nix
    ./zellij.nix
    ./starship.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "yusong";
  home.homeDirectory = "/home/yusong";
  home.enableNixpkgsReleaseCheck = false;

  xresources.properties = {
    # Set mouse cursor size.
    "Xcursor.size" = 16;
    # Set system font size.
    "Xft.dpi" = 172;
  };

  home.packages = with pkgs; [
    helm
    kubectl
    lazygit
    tokei
    tree
    yazi
    just
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
}
