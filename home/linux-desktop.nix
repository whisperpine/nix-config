{ username, pkgs, ... }:
{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.packages = with pkgs; [
    anki
    ddcutil
  ];
  imports = [
    ./desktop.nix
    ./wezterm
    ./ghostty
  ];
}
