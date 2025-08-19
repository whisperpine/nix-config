{ ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableNushellIntegration = false;
  };

  xdg.configFile.direnv = {
    source = ./direnv.toml;
    target = "./direnv/direnv.toml";
  };
}
