{
  self, nixpkgs, nixpkgs-stable, nixos-wsl, home-manager, ...
}@inputs:
{
  nixosConfigurations = {
    # windows wsl
    nixos = import ./x86_64-linux-wsl.nix inputs;
    # mac mini
    creator = import ./aarch64-darwin.nix inputs;
  };
}

