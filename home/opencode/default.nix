{ pkgs, config, ... }:
# --- ai coding agent --- #
let
  repoDir = builtins.getEnv "PWD";
  opencodeConfig = "${repoDir}/home/opencode/opencode.json";
  tuiConfig = "${repoDir}/home/opencode/tui.json";
  agentsDir = "${repoDir}/home/opencode/agents";
  commandsDir = "${repoDir}/home/opencode/commands";
  toolsDir = "${repoDir}/home/opencode/tools";
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

  xdg.configFile.agentsDir = {
    source = config.lib.file.mkOutOfStoreSymlink agentsDir;
    target = "./opencode/agents";
  };

  xdg.configFile.commandsDir = {
    source = config.lib.file.mkOutOfStoreSymlink commandsDir;
    target = "./opencode/commands";
  };

  xdg.configFile.toolsDir = {
    source = config.lib.file.mkOutOfStoreSymlink toolsDir;
    target = "./opencode/tools";
  };
}
