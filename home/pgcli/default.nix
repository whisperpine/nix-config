{ config, ... }:
# --- cli for postgresql --- #
let
  repoDir = builtins.getEnv "PWD";
  pgcliConfig = "${repoDir}/home/pgcli/config";
in
{
  # # NOTE: pgcli should be installed in repo level,
  # # thereby the following line is commented.
  # home.packages = with pkgs; [ pgcli ];

  xdg.configFile.pgcli = {
    source = config.lib.file.mkOutOfStoreSymlink pgcliConfig;
    target = "./pgcli/config";
  };
}
