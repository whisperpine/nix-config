input@{
  self,
  nixpkgs-stable,
  home-manager,
  nix-darwin,
  sops-nix,
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
    { lib, pkgs, ... }:
    {
      system = {
        # Set Git commit hash for darwin-version.
        configurationRevision = self.rev or self.dirtyRev or null;
        # Used for backwards compatibility.
        stateVersion = lib.mkForce 5;
      };
      # Override user's home directory (defined in host-users.nix).
      users.users."${username}".home = lib.mkForce "/Users/${username}";
      # This is important to find command path (e.g. nix, darwin-rebuild).
      programs.zsh.enable = true;
      # Install packages in operating system.
      environment.systemPackages = with pkgs; [
        mkalias
        alacritty
        wezterm
      ];
    };
in
nix-darwin.lib.darwinSystem {
  # Make inherited variables accessible to modules.
  # Caution: DO NOT rename `specialArgs`.
  inherit specialArgs;
  # Merge modules.
  modules = [
    # This module id defined above in "let" expression.
    configuration

    ./modules/nix-core.nix
    ./modules/host-users.nix
    ./modules/darwin-system.nix
    ./modules/fonts.nix

    # sops-nix module differs in linux and darwin
    sops-nix.darwinModules.sops
    ./modules/sops-nix.nix

    # Home Manager settings.
    home-manager.darwinModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${username} = import ../home/darwin-desktop.nix;
      home-manager.extraSpecialArgs = specialArgs;
    }
  ];
}
