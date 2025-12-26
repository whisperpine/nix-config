{ pkgs, config, ... }:
# ---------- wireguard configs ---------- #
{
  # Add "wireguard" kernel module.
  boot.kernelModules = [ "wireguard" ];

  # Install tools to operate wireguard.
  environment.systemPackages = with pkgs; [
    wireguard-tools # wg, wg-quick
  ];

  # The default value is "networking.wireguard.interfaces != { }".
  networking.wireguard.enable = true;

  # Network interface "wg0".
  # Enable the "wg0" network interface by running `systemctl start wg-quick-wg0`.
  # Find the generated config file by running `systemctl cat wg-quick-wg0`.
  networking.wg-quick.interfaces."wg0" = {
    # Whether to bring up this interface automatically during boot.
    autostart = false;
    # Can be either "wireguard" (default) or "amneziawg".
    type = "wireguard";
    # Use the private key file path managed by sops-nix.
    privateKeyFile = config.sops.secrets."wg0-private-key".path;
    # If not specified, it'll be auto generated based on interface name.
    listenPort = 51820;
    # The IP addresses of the interface.
    address = [ "10.1.2.1/32" ]; # todo: design
    # Peers linked to the interface.
    peers = [
      {
        publicKey = "dS/93tpMHXsEYt3gbb16rFLKAI4VzZA5z9LX/O2ZNUU="; # todo: no longer used
        allowedIPs = [ "192.168.15.15/32" ]; # todo: no longer used
        # # Route everything that's not included in the routing table.
        # allowedIPs = [ "0.0.0.0/0" ];
        endpoint = "52.76.92.92:51820"; # todo: no longer used; should be encrypted by sops
        persistentKeepalive = 25;
      }
    ];
  };
}
