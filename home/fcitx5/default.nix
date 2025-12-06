{ pkgs, config, ... }:
let
  repoDir = builtins.getEnv "PWD";
  fcitx5Config = "${repoDir}/home/fcitx5";
in
{
  i18n.inputMethod.enable = true;
  i18n.inputMethod.type = "fcitx5";
  i18n.inputMethod.fcitx5 = {
    waylandFrontend = true;
    addons = with pkgs; [
      fcitx5-gtk
      kdePackages.fcitx5-configtool
      kdePackages.fcitx5-chinese-addons # Simplified Chinese
      fcitx5-pinyin-zhwiki # dictionary for Simplified Chinese
      fcitx5-pinyin-moegirl # dictionary for Simplified Chinese
    ];
  };

  xdg.configFile.fcitx5 = {
    source = config.lib.file.mkOutOfStoreSymlink fcitx5Config;
  };
}
