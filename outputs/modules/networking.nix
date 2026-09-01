{ ... }:
# ---------- networking configs ---------- #
{
  # Enable network manager.
  networking.networkmanager.enable = true;

  # # Enable The AmneziaVPN client.
  # # It also changes the DNS server in "/etc/resolv.conf".
  # programs.amnezia-vpn.enable = true;
  #
  # # Enable clash-verge-rev.
  # programs.clash-verge = {
  #   enable = true;
  #   tunMode = true;
  #   serviceMode = true;
  #   group = username;
  #   package = pkgs.clash-verge-rev;
  # };
  #
  # # This option modifies "/etc/xdg/mimeapps.list
  # xdg.mime.defaultApplications = {
  #   "x-scheme-handler/clash" = "clash-verge.desktop";
  #   "x-scheme-handler/clash-verge" = "clash-verge.desktop";
  # };
  #
  # networking.firewall = {
  #   # Trust the TUN interface so reverse path filter & input don't drop packets.
  #   # IMPORTANT: it's required to configure this to use the TUN mode of clash-verge.
  #   trustedInterfaces = [ "Meta" ]; # "Mihomo" or "Meta" - check `ip link` after start
  # };
}
