{ pkgs, ... }:
# --- file manager for gnome --- #
{
  home.packages = with pkgs; [ nautilus ];
  xdg.mimeApps.associations.added = {
    "inode/directory" = "org.gnome.Nautilus.nautilus-wrapper";
  };
}
