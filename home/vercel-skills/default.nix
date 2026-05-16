{ pkgs, config, ... }:
# --- agent skills tool --- #
let
  repoDir = builtins.getEnv "PWD";
  symlink = config.lib.file.mkOutOfStoreSymlink;
  skillLockPath = "${repoDir}/home/vercel-skills/.skill-lock.json";
in
{
  home.packages = with pkgs; [ skills ];

  # "~/.agents/.skill-lock.json"
  home.file.".agents/.skill-lock.json".source = symlink skillLockPath;
}
