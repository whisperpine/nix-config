{ pkgs, ... }:
# --- file-tree visualizer --- #
{
  home.packages = with pkgs; [ erdtree ];

  xdg.configFile.erdtree = {
    source = ./.erdtree.toml;
    target = "./erdtree/.erdtree.toml";
  };
}
