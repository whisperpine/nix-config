{ pkgs, ... }:
{
  home.packages = with pkgs; [ zellij ];
  xdg.configFile.zellij = {
    source = ./config.kdl;
    target = "./zellij/config.kdl";
  };
}
