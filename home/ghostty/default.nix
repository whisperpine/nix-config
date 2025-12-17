{ pkgs, config, ... }:
# --- terminal emulator --- #
let
  repoDir = builtins.getEnv "PWD";
  ghosttyConfig = "${repoDir}/home/ghostty/config";
in
{
  home.packages = with pkgs; [ ghostty ];
  xdg.configFile.ghostty = {
    source = config.lib.file.mkOutOfStoreSymlink ghosttyConfig;
    target = "./ghostty/config";
  };
}
