{ pkgs, config, ... }:
# --- modal text editor --- #
let
  repoDir = builtins.getEnv "PWD";
  helixConfig = "${repoDir}/home/helix/config.toml";
in
{
  home.packages = with pkgs; [ helix ];
  xdg.configFile.helix = {
    source = config.lib.file.mkOutOfStoreSymlink helixConfig;
    target = "./helix/config.toml";
  };
}
