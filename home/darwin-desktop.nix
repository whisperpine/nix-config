{ username, pkgs, ... }:
{
  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.packages = with pkgs; [
    colima
    docker
  ];
  imports = [
    ./desktop.nix
    ./alacritty
    ./wezterm
    ./zsh
  ];
}
