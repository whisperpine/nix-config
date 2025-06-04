{ pkgs, ... }:
let
  home = builtins.getEnv "HOME";
in
{
  home.packages = with pkgs; [
    git
    delta
    git-lfs
  ];

  xdg.configFile.gitconfig = {
    source = ./.gitconfig;
    target = "${home}/.gitconfig";
  };

  xdg.configFile.themes = {
    source = ./themes.gitconfig;
    target = "./git/themes.gitconfig";
  };
}
