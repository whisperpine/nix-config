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
    # zathura
    "application/pdf" = "zathura.desktop";
    # clash-verge
    "x-scheme-handler/clash" = "clash-verge.desktop";
    "x-scheme-handler/clash-verge" = "clash-verge.desktop";
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
      fuzzel
      hyprlock
      blender
    ]
    ++ [ discord ];

  imports = [
    ./desktop.nix
    ./alacritty
    ./wezterm
    ./ghostty
    ./zathura
    ./cursor
    ./niri
  ];
}
