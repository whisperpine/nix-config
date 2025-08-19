{ ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = false;
  };

  xdg.configFile.direnv = {
    source = ./direnv.toml;
    target = "./direnv/direnv.toml";
  };
}
