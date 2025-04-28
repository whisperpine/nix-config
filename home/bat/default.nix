{ pkgs, ... }:
{
  home.packages = with pkgs; [ bat ];

  xdg.configFile.bat = {
    enable = true;
    source = ./config;
    target = "./bat/config";
  };
}
