{
  pkgs,
  lib,
  config,
  ...
}:
# --- i18n input method --- #
let
  repoDir = builtins.getEnv "PWD";
  fcitx5Config = "${repoDir}/home/fcitx5";
  fcitx5Package = pkgs.kdePackages.fcitx5-with-addons.override {
    addons = with pkgs; [
      kdePackages.fcitx5-configtool
      kdePackages.fcitx5-chinese-addons
    ];
  };
in
{
  # Install fcitx5 with add-ons.
  home.packages = [ fcitx5Package ];

  # Symlink config files.
  xdg.configFile.fcitx5 = {
    source = config.lib.file.mkOutOfStoreSymlink fcitx5Config;
  };

  # Set environment variables.
  home.sessionVariables = {
    # GLFW_IM_MODULE = "ibus"; # IME support in kitty
    SDL_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  # Important: deliberately disable this service to prevent fcitx from starting
  # before the wayland composer (e.g. Niri).
  systemd.user.services."app-org.fcitx.Fcitx5@autostart" = lib.mkForce { };

  # The systemd service to auto start fcitx5.
  # Important: fcitx5 should be started AFTER the wayland composer.
  systemd.user.services.fcitx5-daemon = lib.mkForce {
    Unit = {
      Description = "Fcitx5 input method editor";
      After = [ "xdg-desktop-autostart.target" ];
      Wants = [ "xdg-desktop-autostart.target" ];
    };
    Service = {
      ExecStart = "${fcitx5Package}/bin/fcitx5 -r";
      Restart = "on-failure";
      RestartSec = 5;
    };
    Install = {
      WantedBy = [ "xdg-desktop-autostart.target" ];
    };
  };
}
