{
  bookokrat,
  username,
  pkgs,
  ...
}:
let
  # Check if the system is x86_64-linux.
  isX86_64 = pkgs.stdenv.hostPlatform.system == "x86_64-linux";
  # Bookokrat (from the "inputs" in flake.nix).
  brat = bookokrat.packages.${pkgs.stdenv.hostPlatform.system}.default;
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
      udiskie # disk automounter for udisks
      wechat # messaging and calling app
    ]
    ++ [ brat ]
    ++ (lib.optionals isX86_64 [
      # "discord" is unfree.
      discord
    ]);

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
    ./udiskie # disk automounter for udisks
    ./zathura # keyboard-first pdf reader
    ./anki # spaced repetition flashcard
    ./blender # the freedom to create
    ./otd # OpenTabletDriver's icon
    ./fcitx5 # i18n input method
    ./imv # image previewer
    ./mpv # video player
  ];
}
