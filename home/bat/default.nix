{ pkgs, ... }:
{
  home.packages = with pkgs; [ bat ];

  xdg.configFile.bat = {
    source = ./config;
    target = "./bat/config";
  };
}
