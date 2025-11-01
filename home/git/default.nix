{ pkgs, config, ... }:
let
  repoDir = builtins.getEnv "PWD";
  gitconfig = "${repoDir}/home/git/.gitconfig";
  allowedSigners = "${repoDir}/home/git/allowed_signers";
in
{
  home.packages = with pkgs; [
    git
    delta
    git-lfs
  ];

  home.file.".gitconfig".source = config.lib.file.mkOutOfStoreSymlink gitconfig;
  home.file.".ssh/allowed_signers".source = config.lib.file.mkOutOfStoreSymlink allowedSigners;

  xdg.configFile.themes = {
    source = ./themes.gitconfig;
    target = "./git/themes.gitconfig";
  };
}
