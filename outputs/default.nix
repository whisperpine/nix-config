{ ... }@inputs:
{
  # "devShells" environment can be entered by `nix develop`.
  devShells = import ./dev-shells.nix inputs;

  darwinConfigurations = {
    # mac mini.
    "creator" = import ./darwin-desktop.nix (
      inputs
      // {
        hostname = "creator";
        system = "aarch64-darwin";
      }
    );
  };

  nixosConfigurations = {
    # wsl (windows subsystem for linux).
    "nixos" = import ./linux-wsl.nix (
      inputs
      // {
        hostname = "nixos";
        system = "x86_64-linux";
      }
    );

    # NixOS desktop x86_64.
    "yunix" = import ./linux-desktop.nix (
      inputs
      // {
        hostname = "yunix";
        system = "x86_64-linux";
      }
    );

    # NixOS desktop aarch64.
    "yunixa" = import ./linux-desktop.nix (
      inputs
      // {
        hostname = "yunixa";
        system = "aarch64-linux";
      }
    );

    # NixOS server x86_64.
    "snix" = import ./linux-server.nix (
      inputs
      // {
        hostname = "snix";
        system = "x86_64-linux";
      }
    );

    # NixOS server aarch64.
    "snixa" = import ./linux-server.nix (
      inputs
      // {
        hostname = "snixa";
        system = "aarch64-linux";
      }
    );
  };
}
