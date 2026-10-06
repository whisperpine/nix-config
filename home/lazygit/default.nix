{ pkgs, config, ... }:
# --- tui for git --- #
let
  repoDir = builtins.getEnv "PWD";
  lazygitConfig = "${repoDir}/home/lazygit/config.yml";
in
{
  home.packages = with pkgs; [ lazygit ];

  xdg.configFile.lazygit = {
    source = config.lib.file.mkOutOfStoreSymlink lazygitConfig;
    target = "./lazygit/config.yml";
  };
}
