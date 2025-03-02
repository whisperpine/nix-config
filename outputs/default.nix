{ ... }@inputs:
{
  darwinConfigurations = {
    # mac mini
    "creator" = import ./darwin.nix (
      inputs
      // {
        hostname = "creator";
        system = "aarch64-darwin";
      }
    );
  };

  nixosConfigurations = {
    # wsl (windows subsystem for linux)
    "nixos" = import ./linux-wsl.nix (
      inputs
      // {
        hostname = "nixos";
        system = "x86_64-linux";
      }
    );

    # nixos desktop x86_64
    "yunix" = import ./linux-desktop.nix (
      inputs
      // {
        hostname = "yunix";
        system = "x86_64-linux";
      }
    );

    # nixos desktop x86_64
    "yunixa" = import ./linux-desktop.nix (
      inputs
      // {
        hostname = "yunixa";
        system = "aarch64-linux";
      }
    );

    # nixos server x86_64
    "snix" = import ./linux-server.nix (
      inputs
      // {
        hostname = "snix";
        system = "x86_64-linux";
      }
    );

    # nixos server aarch64
    "snixa" = import ./linux-server.nix (
      inputs
      // {
        hostname = "snixa";
        system = "aarch64-linux";
      }
    );
  };
}
