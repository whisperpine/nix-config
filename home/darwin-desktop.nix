{ username, pkgs, ... }:
{
  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.packages = with pkgs; [
    colima # container runtime
  ];
  imports = [
    ./desktop.nix
    ./alacritty # terminal emulator
    ./wezterm # terminal emulator
  ];
}
