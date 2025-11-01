{ pkgs, config, ... }:
let
  repoDir = builtins.getEnv "PWD";
  bunPath = "${repoDir}/home/bun/global";
in
{
  home.packages = with pkgs; [ bun ];

  # CAUTION: packages declared in ./global/package.json won't be auto installed.
  # They require manually executing "bun add -g PACKAGE_NAME" or the system services
  # defined in "THIS_REPO/outputs/modules/services/bun-add.nix" (every time OS starts).
  # Manually update global packages by "bun update --latest -g".
  home.file.".bun/install/global" = {
    source = config.lib.file.mkOutOfStoreSymlink bunPath;
    recursive = true;
  };
}
