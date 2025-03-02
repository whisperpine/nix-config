{ username, pkgs, ... }:
{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.packages = with pkgs; [ helm ];
  imports = [ ./base.nix ];
}
