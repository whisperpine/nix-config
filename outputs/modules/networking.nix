{ ... }:
# ----------  networking configs ---------- #
{
  # Enable network manager.
  networking.networkmanager.enable = true;

  # Setup network proxy (in conjunction with e.g. clash).
  networking.proxy.default = "http://127.0.0.1:7897";
  networking.proxy.noProxy = "127.0.0.1,localhost";

  # Enable clash-verge-rev.
  programs.clash-verge.enable = true;
  # This option modifies "/etc/xdg/mimeapps.list
  xdg.mime.defaultApplications = {
    "x-scheme-handler/clash" = "clash-verge.desktop";
    "x-scheme-handler/clash-verge" = "clash-verge.desktop";
  };
}
