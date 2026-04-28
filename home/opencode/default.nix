{ pkgs, config, ... }:
# --- ai coding agent --- #
let
  repoDir = builtins.getEnv "PWD";
  opencodeConfig = "${repoDir}/home/opencode/opencode.json";
  tuiConfig = "${repoDir}/home/opencode/tui.json";
in
{
  home.packages = with pkgs; [ opencode ];
  xdg.configFile.opencode = {
    source = config.lib.file.mkOutOfStoreSymlink opencodeConfig;
    target = "./opencode/opencode.json";
  };
  xdg.configFile.opencodeTui = {
    source = config.lib.file.mkOutOfStoreSymlink tuiConfig;
    target = "./opencode/tui.json";
  };
}
