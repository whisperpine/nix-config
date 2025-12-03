{ username, pkgs, ... }:
{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.packages = with pkgs; [
    kitty
    # waybar
    # dunst
    # libnotify
  ];
  imports = [
    ./desktop.nix
    ./wezterm
    ./alacritty
    ./xdg
    # ./hyprland
  ];
}
