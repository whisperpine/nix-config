{
  nixpkgs,
  nixpkgs-stable,
  neovim-nightly-overlay,
  home-manager,
  nixos-wsl,
  ...
}:
let
  system = "x86_64-linux";
  # Pass non-default args to modules.
  extraSpecialArgs = {
    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
    inherit neovim-nightly-overlay;
  };
  configuration =
    { pkgs, config, ... }:
    {
      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It's perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "24.05";
      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = system;
      # Enable experimental features.
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      # It doesn't need to keep too much generations.
      boot.loader.systemd-boot.configurationLimit = 10;
      # Set nushell as the default shell for all users.
      users.defaultUserShell = pkgs.nushell;
      # Set system-wide environment variables.
      environment.variables.EDITOR = "nvim";
      # Enable docker.
      users.extraGroups.docker.members = [ "yusong" ];
      virtualisation.oci-containers.backend = "docker";
      virtualisation.docker = {
        enable = true;
        rootless.enable = true;
        daemon.settings.userland-proxy = false;
      };
      # Optimize storage.
      nix.settings.auto-optimise-store = true;
      # Do garbage collection weekly to keep disk usage low.
      nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 1w";
      };
      # Install packages in operating system.
      environment.systemPackages = with pkgs; [
        git
        git-lfs
        wget
        curl
        clang
        neovim
        nushell
        unzip
        docker-compose
        # WSL specific.
        xdg-utils
        wslu
      ];
    };
in
nixpkgs.lib.nixosSystem {
  modules = [
    # This modules id defined above in "let" expression.
    configuration

    # WSL (Windows Subsystem for Linux).
    nixos-wsl.nixosModules.default
    {
      system.stateVersion = "24.05";
      wsl.enable = true;
      wsl.defaultUser = "yusong";
    }

    # Home Manager as a module.
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.yusong = import ../home/linux.nix;
      home-manager.extraSpecialArgs = extraSpecialArgs;
    }
  ];
}
