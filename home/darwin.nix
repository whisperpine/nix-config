{ username, pkgs, ... }:
{
  imports = [ ./base.nix ];
  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.packages = with pkgs; [
    colima
    docker
  ];
}
