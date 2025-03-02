{ username, ... }:
#----------  docker configuration ----------#
{
  # Enable docker.
  users.extraGroups.docker.members = [ "${username}" ];
  virtualisation.oci-containers.backend = "docker";
  virtualisation.docker = {
    enable = true;
    rootless.enable = true;
    # Config /etc/docker/daemon.json:
    # https://docs.docker.com/reference/cli/dockerd/#daemon-configuration-file
    daemon.settings = {
      userland-proxy = false;
      # Enable containerd image store:
      # https://docs.docker.com/engine/storage/containerd/
      features.containerd-snapshotter = true;
    };
  };
}
