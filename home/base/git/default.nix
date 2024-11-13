{ ... }:
let
  home = builtins.getEnv "HOME";
in
{
  programs.git = {
    enable = true;
  };

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
