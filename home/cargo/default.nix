{ pkgs, config, ... }:
# --- cargo configs --- #
let
  repoDir = builtins.getEnv "PWD";
  cargoConfig = "${repoDir}/home/cargo/config.toml";
in
{
  home.packages = with pkgs; [ sccache ];
  home.file.".cargo/config.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink cargoConfig;
  };
}
