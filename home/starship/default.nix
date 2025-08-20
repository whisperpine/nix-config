{ ... }:
{
  # NOTE: do not change this to: `home.packages = with pkgs; [ starship ];`.
  # Otherwise the integration of shells (e.g. nushell) will be disabled.
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };

  xdg.configFile.starship = {
    source = ./starship.toml;
    target = "./starship.toml";
  };
}
