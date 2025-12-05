{ username, pkgs, ... }:
{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.packages = with pkgs; [
    anki
    ddcutil
    fuzzel
    hyprlock
    discord
  ];
  imports = [
    ./desktop.nix
    ./alacritty
    ./wezterm
    ./ghostty
    ./cursor
    ./niri
  ];
}
