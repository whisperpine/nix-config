{
  self,
  pkgs,
  system,
  username,
  ...
}:
# ---------- nix-core configs ---------- #
{
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11";

  # Sets "Configuration Revision" with git sha when building.
  # To see the "Configuration Revision", run `nixos-rebuild list-generations`.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = system;

  # Enables experimental features.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Sets up binary cache.
  nix.settings = {
    substituters = [
      # The official cache server of nixpkgs.
      "https://cache.nixos.org"
      # For cuda packages (e.g. cudaPackages.cudatoolkit).
      "https://cache.nixos-cuda.org"
    ];
    trusted-public-keys = [ "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M=" ];
  };

  # Sets system-wide environment variables.
  # Note: changes on these env vars need system reboot to take effect.
  environment.variables = {
    EDITOR = "nvim";
    PYTHON_HISTORY = "/dev/null"; # disable ~/.python_history
    ZK_SHELL = "bash"; # used by the `zk` command
    # Tells the dynamic link loader where to search for shared libraries (".so" files):
    # - Some developer tools or libs require "${pkgs.stdenv.cc.cc.lib}/lib".
    # - Pytorch requires "/run/opengl-driver/lib" to make cuda available.
    LD_LIBRARY_PATH = "/run/opengl-driver/lib:${pkgs.stdenv.cc.cc.lib}/lib";
    # SHELL = "/etc/profiles/per-user/${username}/bin/nu";
    SHELL = "/etc/profiles/per-user/${username}/bin/zsh";
    # SHELL = "/sbin/bash";
  };

  # Optimizes storage.
  nix.optimise.automatic = true;

  time.timeZone = "Asia/Shanghai";
}
