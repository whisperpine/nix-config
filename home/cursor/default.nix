{ pkgs, ... }:
{
  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 22;

    # Enable GTK and X11 integration for broader application support.
    gtk.enable = true;
    x11.enable = true;
  };
}
