{ username, ... }:
{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  imports = [
    ./desktop.nix
    ./wezterm
  ];
}
