{ pkgs, config, ... }:
# --- app launcher --- #
let
  repoDir = builtins.getEnv "PWD";
  fuzzelConfig = "${repoDir}/home/fuzzel/fuzzel.ini";
  fuzzelDmenu = "${repoDir}/home/fuzzel/fuzzel-dmenu.sh";
  fuzzelDict = "${repoDir}/home/fuzzel/fuzzel-dict.sh";
in
{
  home.packages = with pkgs; [ fuzzel ];

  xdg.configFile.fuzzel = {
    source = config.lib.file.mkOutOfStoreSymlink fuzzelConfig;
    target = "./fuzzel/fuzzel.ini";
  };

  # "~/.config/fuzzel/fuzzel-dmenu.sh"
  xdg.configFile.fuzzelDmenu = {
    source = config.lib.file.mkOutOfStoreSymlink fuzzelDmenu;
    target = "./fuzzel/fuzzel-dmenu.sh";
  };

  # "~/.config/fuzzel/fuzzel-dict.sh"
  xdg.configFile.fuzzelDict = {
    source = config.lib.file.mkOutOfStoreSymlink fuzzelDict;
    target = "./fuzzel/fuzzel-dict.sh";
  };
}
