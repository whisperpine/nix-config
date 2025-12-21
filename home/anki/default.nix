{ pkgs, ... }:
{
  home.packages = with pkgs; [ anki ];

  # Force Anki to use Wayland.
  # https://docs.ankiweb.net/platform/linux/wayland.html
  home.sessionVariables.ANKI_WAYLAND = "1";

  # This will install the icon to "~/.local/share/icons/anki.png".
  xdg.dataFile."icons/anki.png".source = ./anki.png;
}
