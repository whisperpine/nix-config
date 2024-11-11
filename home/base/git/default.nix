{ ... }:
{
  programs.git = {
    enable = true;
  };

  xdg.configFile.gitconfig = {
    enable = true;
    source = ./.gitconfig;
    target = "/home/yusong/.gitconfig";
  };

  xdg.configFile.themes = {
    enable = true;
    source = ./themes.gitconfig;
    target = "./git/themes.gitconfig";
  };
}
