{ pkgs, ... }:
{
  # Inotify-tools doesn't support macOS.
  home.packages = pkgs.lib.mkIf (!pkgs.stdenv.hostPlatform.isDarwin) [ pkgs.inotify-tools ];
}
