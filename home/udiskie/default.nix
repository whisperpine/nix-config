{ pkgs, ... }:
# --- disk automounter for udisks --- #
{
  home.packages = with pkgs; [ udiskie ];

  # The systemd service to auto start udiskie.
  # Important: udiskie should be started AFTER the wayland composer,
  # so that the tray can be shown properly.
  systemd.user.services.udiskie = {
    Unit = {
      Description = "udiskie mount daemon";
      After = [
        "tray.target"
        "xdg-desktop-autostart.target"
      ];
      Requires = [
        "tray.target"
        "xdg-desktop-autostart.target"
      ];
    };
    Service = {
      ExecStart = "${pkgs.udiskie}/bin/udiskie --no-notify --smart-tray";
      Restart = "on-failure";
      RestartSec = 5;
    };
    Install = {
      WantedBy = [ "xdg-desktop-autostart.target" ];
    };
  };
}
