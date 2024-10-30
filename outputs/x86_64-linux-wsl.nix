{
  self, nixpkgs, nixpkgs-stable, nixos-wsl, home-manager, ...
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
  system = system;

  modules = [
    ./system-base.nix

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
