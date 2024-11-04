{ ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  xdg.configFile.direnv = {
    enable = true;
    source = ./direnv.toml;
    target = "./direnv/direnv.toml";
  };
}
