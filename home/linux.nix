{ username, pkgs, ... }:
{
  imports = [ ./base.nix ];
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.packages = with pkgs; [ helm ];
}
