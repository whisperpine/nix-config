{ pkgs, ... }:
{
  # Inotify-tools doesn't support macOS.
  home.packages = pkgs.lib.mkIf (!pkgs.stdenv.isDarwin) [ pkgs.inotify-tools ];
}
