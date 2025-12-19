{ username, ... }:
# ----------  docker configs ---------- #
# How to remove docker entirely:
# sudo rm -rf /var/lib/docker     # Remove the entire data root
# rm -rf ~/.local/share/docker    # Where images/volumes live in rootless
# rm -rf ~/.docker                # CLI credentials/config
# rm -rf ~/.config/docker         # Config files
{
  # Allow the user to run docker commands without typing sudo every time.
  users.extraGroups.docker.members = [ "${username}" ];

  # The underlying Docker implementation to use ("docker" or "podman").
  virtualisation.oci-containers.backend = "docker";

  # # Docker rootless mode.
  # virtualisation.docker.rootless = {
  #   enable = true;
  #   # Point DOCKER_HOST to rootless Docker instance for normal users by default.
  #   setSocketVariable = true;
  #   # Config "/etc/docker/daemon.json" (actually not this path):
  #   # https://docs.docker.com/reference/cli/dockerd/#daemon-configuration-file
  #   # Note: the generated config file path can be found by `systemctl cat docker`.
  #   daemon.settings = {
  #     # Enable containerd image store:
  #     # https://docs.docker.com/engine/storage/containerd/
  #     features.containerd-snapshotter = true;
  #   };
  # };

  # Docker root mode (consider use rootless mode instead).
  virtualisation.docker = {
    # Enable docker.
    enable = true;
    # Config "/etc/docker/daemon.json" (actually not this path):
    # https://docs.docker.com/reference/cli/dockerd/#daemon-configuration-file
    # Note: the generated config file path can be found by `systemctl cat docker`.
    daemon.settings = {
      # Enable containerd image store:
      # https://docs.docker.com/engine/storage/containerd/
      features.containerd-snapshotter = true;
    };
  };
}
