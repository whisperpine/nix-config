{
  lib,
  system,
  username,
  ...
}:
#----------  nix-core configuration ----------#
{
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = lib.mkDefault "24.05";
  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = system;
  # Enable experimental features.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # # It doesn't need to keep too much generations.
  # boot.loader.systemd-boot.configurationLimit = 10;
  # Set system-wide environment variables.
  environment.variables = {
    EDITOR = "nvim";
    ZK_SHELL = "bash";
    SHELL = "/etc/profiles/per-user/${username}/bin/nu";
  };
  # Optimize storage.
  nix.optimise.automatic = true;
}
