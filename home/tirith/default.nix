{ pkgs, config, ... }:
# --- shell security guard --- #
let
  repoDir = builtins.getEnv "PWD";
  tirithConfig = "${repoDir}/home/tirith/policy.yaml";
in
{
  home.packages = with pkgs; [ tirith ];
  xdg.configFile.tirith = {
    source = config.lib.file.mkOutOfStoreSymlink tirithConfig;
    target = "./tirith/policy.yaml";
  };
}
