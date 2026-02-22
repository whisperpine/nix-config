{ pkgs-stable, config, ... }:
# --- terminal file manager --- #
let
  repoDir = builtins.getEnv "PWD";
  yaziConfig = "${repoDir}/home/yazi";
  mklink = config.lib.file.mkOutOfStoreSymlink;
in
{
  # Note: switch back to the latest version after "26.1.22".
  # Since this issue has been fixed in: https://github.com/sxyazi/yazi/pull/3678
  home.packages = with pkgs-stable; [ yazi ];
  xdg.configFile.yazi.source = mklink yaziConfig;
}
