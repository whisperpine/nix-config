{ config, ... }:
let
  repoDir = builtins.getEnv "PWD";
  skillsPath = "${repoDir}/home/skills";
  symlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  # "~/.config/opencode/skills"
  xdg.configFile.opencodeSkills = {
    source = symlink skillsPath;
    target = "./opencode/skills";
  };

  # "~/.claude/skills"
  home.file.".claude/skills".source = symlink skillsPath;

  # "~/.agents/skills"
  home.file.".agents/skills".source = symlink skillsPath;
}
