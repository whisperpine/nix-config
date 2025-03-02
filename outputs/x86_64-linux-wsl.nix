input@{
  nixpkgs,
  nixpkgs-stable,
  home-manager,
  nixos-wsl,
  hostname,
  ...
}:
let
  username = "yusong";
  system = "x86_64-linux";
  # Pass non-default args to modules.
  # Caution: DO NOT rename `specialArgs`.
  specialArgs = input // {
    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
    # Allow unfree software to be installed.
    nixpkgs.config.allowUnfree = true;
    # Inhereit variables define above.
    inherit system username hostname;
  };
  configuration =
    { pkgs, config, ... }:
    {
      # Install packages in operating system.
      environment.systemPackages = with pkgs; [
        git
        neovim
        # WSL specific.
        xdg-utils
        wslu
      ];
    };
in
nixpkgs.lib.nixosSystem {
  # Make inherited variables accessible to modules.
  # Caution: DO NOT rename `specialArgs`.
  inherit specialArgs;
  # Merge modules.
  modules = [
    # This modules id defined above in "let" expression.
    configuration

    ./modules/nix-core.nix
    ./modules/host-users.nix
    ./modules/docker.nix

    # WSL (Windows Subsystem for Linux).
    nixos-wsl.nixosModules.default
    {
      wsl.enable = true;
      wsl.defaultUser = username;
      system.stateVersion = "24.05";
    }

    # Home Manager as a module.
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${username} = import ../home/linux.nix;
      home-manager.extraSpecialArgs = specialArgs;
    }
  ];
}
