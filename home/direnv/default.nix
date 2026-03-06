{ config, ... }:
# --- manage dir-based env vars --- #
let
  repoDir = builtins.getEnv "PWD";
  direnvConfig = "${repoDir}/home/direnv/direnv.toml";
in
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = false;
  };

  xdg.configFile.direnv = {
    source = config.lib.file.mkOutOfStoreSymlink direnvConfig;
    target = "./direnv/direnv.toml";
  };
}
