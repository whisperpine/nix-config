{ username, pkgs, ... }:
let
  # pkgs.discord is unfree.
  discord = if pkgs.stdenv.hostPlatform.system == "aarch64-linux" then pkgs.hello else pkgs.discord;
in
{
  home.username = username;
  home.homeDirectory = "/home/${username}";

  xdg.mimeApps.enable = true;
  # This option creates/manages files in both:
  # "~/.config/mimeapps.list" and "~/.local/share/applications/mimeapps.list".
  xdg.mimeApps.defaultApplications = {
    # google-chrome
    "text/html" = "google-chrome.desktop";
    "x-scheme-handler/http" = "google-chrome.desktop";
    "x-scheme-handler/https" = "google-chrome.desktop";
    "x-scheme-handler/about" = "google-chrome.desktop";
  };

  home.packages =
    with pkgs;
    [
      anki
      ddcutil
      hyprlock
      blender
    ]
    ++ [ discord ];

  imports = [
    ./desktop.nix
    ./alacritty
    ./ghostty
    ./dolphin
    ./zathura
    ./fuzzel
    ./cursor
    ./niri
    ./imv
  ];
}
