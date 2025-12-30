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
      hyprpicker # color picker (used by e.g. pastel)
      usbutils # tools for working with usb devices
      alsa-utils # audio utilities (e.g. alsamixer)
      obs-studio # video recording and live streaming
      wechat # messaging and calling app
      # Enable "cudaSupport" to use OptiX in Cycles render.
      (blender.override { cudaSupport = true; })
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
    ./hyprlock # screen locker used by niri
    ./fuzzel # the default app launcher
    ./waybar # customizable wayland bar
    ./niri # wayland compositor

    # --- applications --- #
    ./nautilus # file manager for gnome
    ./cursor # customized cursor or pointer
    ./onedrive # onedrive client for linux
    ./zathura # keyboard-first pdf reader
    ./otd # OpenTabletDriver's icon
    ./fcitx5 # i18n input method
    ./imv # image previewer
    ./mpv # video player
    ./anki
  ];
}
