{ nixpkgs, ... }@inputs:
let
  supportedSystems = [
    "x86_64-linux"
    "aarch64-linux"
    "x86_64-darwin"
    "aarch64-darwin"
  ];
  forEachSupportedSystem =
    f: nixpkgs.lib.genAttrs supportedSystems (system: f { pkgs = import nixpkgs { inherit system; }; });
in
{
  devShells = forEachSupportedSystem (
    { pkgs }:
    {
      default = pkgs.mkShell {
        packages = with pkgs; [
          husky
          typos
        ];
        shellHook = ''
          # install git hook managed by husky
          if [ ! -e "./.husky/_" ]; then
            husky install
          fi
        '';
      };
    }
  );

  darwinConfigurations = {
    # mac mini
    "creator" = import ./darwin-desktop.nix (
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
