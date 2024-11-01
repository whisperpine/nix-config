{ pkgs, ... }:
{
  programs.starship = {
    enable = true;
  };
  xdg.configFile.starship = {
    enable = true;
    source = ./starship.toml;
    target = "./starship.toml";
  };
}

