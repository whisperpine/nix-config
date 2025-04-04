{ pkgs, ... }:
{
  home.packages = with pkgs; [ pgcli ];

  xdg.configFile.pgcli = {
    enable = true;
    source = ./config;
    target = "./pgcli/config";
  };
}
