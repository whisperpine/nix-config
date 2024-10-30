{
  self, nixpkgs, nixpkgs-stable, home-manager, nixos-wsl, ...
}@inputs: let
  system = "x86_64-linux";
  # Pass non-defualt args to modules.
  extraSpecialArgs = {
    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
  };
in
nixpkgs.lib.nixosSystem {
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05";

  # Set system architecture.
  system = system;

  # Enable experimental features.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set nushell as the default shell for all users.
  users.defaultUserShell = pkgs.nushell;

  # It doesn't need to keep too much generations.
  boot.loader.systemd-boot.configurationLimit = 10;

  # Set system-wide environment variables.
  environment.variables.EDITOR = "nvim";

  # Install packages in operating system.
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    neovim
    nushell
  ];

  # Optimise storage.
  nix.settings.auto-optimise-store = true;

  # Do garbage collection weekly to keep disk usage low.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  modules = [
    # WSL (Windows Subsystem for Linux).
    nixos-wsl.nixosModules.default {
      system.stateVersion = "24.05";
      wsl.enable = true;
      wsl.defaultUser = "yusong";
    }

    # Home Manager as a module.
    home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.yusong = import ../home/linux.nix;
      home-manager.extraSpecialArgs = extraSpecialArgs;
    }
  ];
}
