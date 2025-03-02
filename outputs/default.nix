{ ... }@inputs:
{
  nixosConfigurations = {
    # windows wsl
    "nixos" = import ./x86_64-linux-wsl.nix (inputs // { hostname = "nixos"; });
  };

  darwinConfigurations = {
    # mac mini
    "creator" = import ./aarch64-darwin.nix (inputs // { hostname = "creator"; });
  };
}
