{ pkgs, ... }:
#---------- k3s configuration ----------#
#---------------- notes ----------------#
# To get the credential for accessing k3s:
# mkdir -p ~/.kube && touch ~/.kube/config
# Copy text in /etc/rancher/k3s/k3s.yaml to ~/.kube/config
#
# To fulling remove k3s, run the following commands:
# sudo rm -rf /var/lib/rancher/k3s  # Remove k3s data directory
# sudo rm -rf /etc/rancher/k3s      # Remove k3s configuration
# sudo rm -rf /var/lib/containerd   # Remove containerd state (if no other services use it)
#---------------- notes ----------------#
{
  # Enable k3s as the Kubernetes distribution
  services.k3s = {
    enable = true;
    package = pkgs.k3s;
    role = "server"; # Single-node cluster (server + agent)
    extraFlags = "--disable traefik --disable servicelb"; # Disable unnecessary components for simplicity
  };

  # Open necessary ports for Kubernetes
  networking.firewall.allowedTCPPorts = [
    6443 # k3s: required so that pods can reach the API server (running on port 6443 by default)
    # 2379 # k3s, etcd clients: required if using a "High Availability Embedded etcd" configuration
    # 2380 # k3s, etcd peers: required if using a "High Availability Embedded etcd" configuration
  ];
  networking.firewall.allowedUDPPorts = [
    8472 # k3s, flannel: required if using multi-node for inter-node networking
  ];

  # Enable container runtime (required by k3s)
  virtualisation.containerd.enable = true;
}
