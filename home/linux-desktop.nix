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
