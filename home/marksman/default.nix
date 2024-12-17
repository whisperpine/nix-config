{ ... }:
{
  # marksman is declared in nvim/default.nix

  xdg.configFile.marksman = {
    enable = true;
    source = ./config.toml;
    target = "./marksman/config.toml";
  };
}
