{ pkgs, ... }:
{
  home.packages = with pkgs; [ lazygit ];

  xdg.configFile.lazygit = {
    source = ./config.yml;
    target = "./lazygit/config.yml";
  };
}
