{
  description = "NixOS configuration of Yusong";

  inputs = {
    # Use the unstable branch by default.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # The latest stable branch which can be used as a fallback.
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    # WSL (windwos subsystem for linxu).
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    # Home Manager used for managing user configuration.
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      # The `follows` keyword in inputs is used for inheritance.
      # `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    self, nixpkgs, nixpkgs-stable, nixos-wsl, home-manager, ... 
  }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";

      # Pass non-defualt args to modules.
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
      };

      modules = [
        ./system.nix
        
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
          home-manager.users.yusong = import ./home;
	        #home-manager.extraSpecialArgs = inputs;
        }
      ];
    };
  };
}

