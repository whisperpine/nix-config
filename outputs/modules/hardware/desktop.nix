{ ... }:
# ----------  hardware configs ---------- #
{
  # https://wiki.hyprland.org/Nvidia/#suspendwakeup-issues
  boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];

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

  hardware.nvidia = {
    # Enable experimental power management through systemd.
    powerManagement.enable = true;
    # Enable kernel modesetting when using the NVIDIA proprietary driver.
    modesetting.enable = true;

    # Making sure to use the proprietary drivers until the following issue is fixed:
    # https://github.com/NVIDIA/open-gpu-kernel-modules/issues/472
    open = false;
  };
}
