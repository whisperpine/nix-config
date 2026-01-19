{ ... }:
# ---------- networking configs ---------- #
{
  # Enable network manager.
  networking.networkmanager.enable = true;

  # Enable The AmneziaVPN client.
  # It also changes the DNS server in "/etc/resolv.conf".
  programs.amnezia-vpn.enable = true;

  # # Setup network proxy (in conjunction with e.g. clash).
  # networking.proxy.default = "http://127.0.0.1:7897";
  # networking.proxy.noProxy = "127.0.0.1,localhost";

  # Enable clash-verge-rev.
  programs.clash-verge = {
    enable = true;
    tunMode = true;
    serviceMode = true;
  };
  # This option modifies "/etc/xdg/mimeapps.list
  xdg.mime.defaultApplications = {
    "x-scheme-handler/clash" = "clash-verge.desktop";
    "x-scheme-handler/clash-verge" = "clash-verge.desktop";
  };

  networking.firewall = {
    # Trust the TUN interface so reverse path filter & input don't drop packets.
    # IMPORTANT: it's required to configure this to use the TUN mode of clash-verge.
    trustedInterfaces = [ "Meta" ]; # "Mihomo" or "Meta" — check `ip link` after start
  };
}
