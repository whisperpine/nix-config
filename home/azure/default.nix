{ config, ... }:
# --- azure-cli configs --- #
let
  repoDir = builtins.getEnv "PWD";
  azureConfig = "${repoDir}/home/azure/config";
in
{
  # # NOTE: azure-cli should be installed in repo level,
  # # hence the following line is commented.
  # home.packages = with pkgs; [ azure-cli ];

  # "~/.azure/config"
  home.file.".azure/config" = {
    source = config.lib.file.mkOutOfStoreSymlink azureConfig;
  };
}
