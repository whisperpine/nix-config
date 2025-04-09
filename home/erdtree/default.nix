{ pkgs, ... }:
{
  home.packages = with pkgs; [ erdtree ];

  xdg.configFile.erdtree = {
    enable = true;
    source = ./.erdtree.toml;
    target = "./erdtree/.erdtree.toml";
  };
}
