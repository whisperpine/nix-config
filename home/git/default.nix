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
    enable = true;
    source = ./.gitconfig;
    target = "${home}/.gitconfig";
  };

  xdg.configFile.themes = {
    enable = true;
    source = ./themes.gitconfig;
    target = "./git/themes.gitconfig";
  };
}
