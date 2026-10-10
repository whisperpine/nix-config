{ config, ... }:
# --- cargo configs --- #
let
  repoDir = builtins.getEnv "PWD";
  cargoConfig = "${repoDir}/home/cargo/config.toml";
in
{
  imports = [
    ../sccache # sccache is configured in "config.toml"
  ];

  home.file.".cargo/config.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink cargoConfig;
  };
}
