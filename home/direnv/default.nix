{ ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  xdg.configFile.direnv = {
    source = ./direnv.toml;
    target = "./direnv/direnv.toml";
  };
}
