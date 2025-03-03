{ username, ... }:
{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  imports = [
    ./base.nix
    ./wezterm
  ];
}
