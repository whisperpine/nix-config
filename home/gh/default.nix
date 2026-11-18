{ pkgs, config, ... }:
# --- github cli tool --- #
let
  repoDir = builtins.getEnv "PWD";
  ghConfig = "${repoDir}/home/gh/config.yml";
in
{
  # Note: github cli extensions are managed manually.
  # For example, run the following command to add "gh-actions-lock":
  # gh extension install github/gh-actions-lock

  home.packages = with pkgs; [ gh ];

  xdg.configFile.gh = {
    source = config.lib.file.mkOutOfStoreSymlink ghConfig;
    target = "./gh/config.yml";
  };
}
