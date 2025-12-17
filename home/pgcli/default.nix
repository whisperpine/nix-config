{ ... }:
# --- cli for postgresql --- #
{
  # # NOTE: pgcli should be installed in repo leval,
  # # thereby the following line is commented.
  # home.packages = with pkgs; [ pgcli ];

  xdg.configFile.pgcli = {
    source = ./config;
    target = "./pgcli/config";
  };
}
