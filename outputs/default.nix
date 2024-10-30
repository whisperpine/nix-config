{
  self, nixpkgs, nixpkgs-stable, nixos-wsl, home-manager, nix-darwin, ...
}@inputs:
{
  nixosConfigurations = {
    # windows wsl
    nixos = import ./x86_64-linux-wsl.nix inputs;
  };

  darwinConfigurations = {
    # mac mini
    creator = import ./aarch64-darwin.nix inputs;
  };

  # Expose the package set, including overlays, for convenience.
  darwinPackages = self.darwinConfigurations."creator".pkgs;
}
