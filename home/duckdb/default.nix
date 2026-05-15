{ pkgs, config, ... }:
# --- OLAP embedded database --- #
let
  repoDir = builtins.getEnv "PWD";
  duckdbConfig = "${repoDir}/home/duckdb/.duckdbrc";
in
{
  home.packages = with pkgs; [ duckdb ];
  # "~/.duckdbrc"
  home.file.".duckdbrc".source = config.lib.file.mkOutOfStoreSymlink duckdbConfig;
}
