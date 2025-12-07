{ pkgs, ... }:
{
  home.packages = with pkgs; [ kdePackages.dolphin ];
  xdg.mimeApps.associations.added = {
    "inode/directory" = "org.kde.dolphin.desktop";
  };
}
