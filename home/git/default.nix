{ pkgs, config, ... }:
let
  repoDir = builtins.getEnv "PWD";
  gitconfig = "${repoDir}/home/git/.gitconfig";
in
{
  home.packages = with pkgs; [
    git
    delta
    git-lfs
  ];

  home.file.".gitconfig".source = config.lib.file.mkOutOfStoreSymlink gitconfig;

  xdg.configFile.themes = {
    source = ./themes.gitconfig;
    target = "./git/themes.gitconfig";
  };
}
