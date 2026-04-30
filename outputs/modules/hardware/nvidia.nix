{ config, ... }:
# ----------  nvidia configs ---------- #
{
  # Enables builds with CUDA support with a nixpkgs wide configuration.
  nixpkgs.config.cudaSupport = true;

  # Nvidia GPU configs.
  hardware.nvidia = {
    # Enable experimental power management through systemd.
    powerManagement.enable = true;
    # Enable kernel modesetting when using the NVIDIA proprietary driver.
    modesetting.enable = true;
    # Making sure to use the proprietary drivers until the following issue is fixed:
    # https://github.com/NVIDIA/open-gpu-kernel-modules/issues/472
    open = true;
    # Version 595 has compatibility issues (kernel panics when running Anki).
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  };
}
