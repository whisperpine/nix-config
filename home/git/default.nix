{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git
    delta
    git-lfs
  ];

  home.file.".gitconfig".source = ./.gitconfig;

  xdg.configFile.themes = {
    source = ./themes.gitconfig;
    target = "./git/themes.gitconfig";
  };
}
