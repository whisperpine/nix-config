{ username, pkgs, ... }:
{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.packages = with pkgs; [
    anki
    ddcutil
    fuzzel
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
