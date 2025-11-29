{ system, username, ... }:
# ----------  nix-core configs ---------- #
{
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11";

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = system;

  # Enable experimental features.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Set system-wide environment variables.
  # Note: changes on these env vars need system reboot to take effect.
  environment.variables = {
    EDITOR = "nvim";
    ZK_SHELL = "bash";
    # SHELL = "/etc/profiles/per-user/${username}/bin/nu";
    SHELL = "/etc/profiles/per-user/${username}/bin/zsh";
    # SHELL = "/sbin/bash";
  };

  # Optimize storage.
  nix.optimise.automatic = true;

  time.timeZone = "Asia/Shanghai";
}
