{ config, ... }:
# --- better shell history --- #
let
  repoDir = builtins.getEnv "PWD";
  atuinConfig = "${repoDir}/home/atuin/config.toml";
in
{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableNushellIntegration = false;
  };

  xdg.configFile.atuin = {
    source = config.lib.file.mkOutOfStoreSymlink atuinConfig;
    target = "./atuin/config.toml";
  };
}
