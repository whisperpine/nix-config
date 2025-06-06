input@{
  nixpkgs,
  nixpkgs-stable,
  home-manager,
  nixos-wsl,
  sops-nix,
  system,
  ...
}:
let
  username = "yusong";
  # Pass non-default args to modules.
  # CAUTION: DO NOT rename `specialArgs`.
  specialArgs = input // {
    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
    # Allow unfree software to be installed.
    nixpkgs.config.allowUnfree = true;
    # Inhereit variables define above.
    inherit username;
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
    ./modules/services/k3s.nix

    # sops-nix module differs in linux and darwin
    sops-nix.nixosModules.sops
    ./modules/sops-nix.nix

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
      home-manager.users.${username} = import ../home/linux-wsl.nix;
      home-manager.extraSpecialArgs = specialArgs;
    }
  ];
}
