{
  self, nixpkgs, nixpkgs-stable, home-manager, ...
}@inputs: let
  system = "aarch64-darwin";
  # Pass non-default args to modules.
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

    # Home Manager as a module.
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.yusong = import ../home/darwin.nix;
      home-manager.extraSpecialArgs = extraSpecialArgs;
    }
  ];
}
