{ pkgs, config, ... }:
# --- git configs and extensions --- #
let
  repoDir = builtins.getEnv "PWD";
  gitconfig = "${repoDir}/home/git/.gitconfig";
  allowedSigners = "${repoDir}/home/git/allowed_signers";
  gitThemesConfig = "${repoDir}/home/git/themes.gitconfig";
  gitattributes = "${repoDir}/home/git/.gitattributes";
in
{
  home.packages = with pkgs; [
    git
    git-lfs # large file storage
    delta # syntax-highlighting pager
    mergiraf # syntax-aware git merge driver
  ];

  # "~/.gitconfig"
  home.file.".gitconfig".source = config.lib.file.mkOutOfStoreSymlink gitconfig;

  # "~/.ssh/allowed_signers"
  home.file.".ssh/allowed_signers".source = config.lib.file.mkOutOfStoreSymlink allowedSigners;

  # "~/.config/git/attributes"
  xdg.configFile.gitattributes = {
    source = config.lib.file.mkOutOfStoreSymlink gitattributes;
    target = "./git/attributes";
  };

  # "~/.config/git/themes.gitconfig"
  xdg.configFile.gitThemes = {
    source = config.lib.file.mkOutOfStoreSymlink gitThemesConfig;
    target = "./git/themes.gitconfig";
  };
}
