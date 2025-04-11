{ pkgs, ... }:
{
  home.packages = with pkgs; [ lazygit ];

  xdg.configFile.lazygit = {
    enable = true;
    source = ./config.yml;
    target = "./lazygit/config.yml";
  };
}
