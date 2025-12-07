{ username, pkgs, ... }:
let
  # pkgs.discord is unfree.
  discord = if pkgs.stdenv.hostPlatform.system == "aarch64-linux" then pkgs.hello else pkgs.discord;
in
{
  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.packages =
    with pkgs;
    [
      ddcutil # manage monitors (e.g. brightness)
      hyprlock # screen locker used by niri
      hyprpicker # color picker (used by e.g. pastel)
      blender
    ]
    ++ [ discord ];

  imports = [
    # --- inherit --- #
    ./desktop.nix

    # --- desktop environment --- #
    ./xdg # user xdg configs (e.g. mime apps)
    ./gtk # gtk configs (e.g. dark theme)

    # --- niri bundle --- #
    ./alacritty # alternative terminal
    ./ghostty # the default terminal
    ./fuzzel # the default app launcher
    ./niri # wayland compositor

    # --- applications --- #
    ./dolphin # GUI file explorer
    ./cursor # customized cursor or pointer
    ./zathura # keyboard-first pdf reader
    ./imv # image previewer
    ./anki
  ];
}
