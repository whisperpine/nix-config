{ pkgs, ... }:
{
  home.packages = with pkgs; [ anki ];

  # This will install the icon to "~/.local/share/icons/anki.png".
  xdg.dataFile."icons/anki.png".source = ./anki.png;
}
