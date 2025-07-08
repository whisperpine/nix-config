{ ... }:
#----------  hardware configuration ----------#
{
  # Enabling ip_forward on the host machine is important for the docker
  # container to be able to perform networking tasks (such as cloning the
  # gitlab repo). See: https://nixos.wiki/wiki/Gitlab_runner
  boot.kernel.sysctl."net.ipv4.ip_forward" = true;

  # The devices on which the boot loader, GRUB, will be installed.
  boot.loader.grub.devices = [ "/dev/sdd" ];

  fileSystems = {
    "/" = {
      device = "/dev/sdd";
      fsType = "btrfs";
    };
  };
}
