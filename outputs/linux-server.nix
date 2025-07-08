input@{
  nixpkgs,
  nixpkgs-stable,
  home-manager,
  system,
  ...
}:
let
  username = "yusong";
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
    inherit username;
  };
  configuration =
    { pkgs, config, ... }:
    {
      # Install packages in operating system.
      environment.systemPackages = with pkgs; [
        git
        neovim
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

    ./modules/hardware/server.nix
    ./modules/nix-core.nix
    ./modules/host-users.nix
    ./modules/docker.nix

    # Home Manager as a module.
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${username} = import ../home/linux-server.nix;
      home-manager.extraSpecialArgs = specialArgs;
    }
  ];
}
