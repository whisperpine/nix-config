input@{
  self,
  nixpkgs-stable,
  home-manager,
  nix-darwin,
  hostname,
  ...
}:
let
  username = "yusong";
  system = "aarch64-darwin";
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
    { lib, pkgs, ... }:
    {
      system = {
        # Set Git commit hash for darwin-version.
        configurationRevision = self.rev or self.dirtyRev or null;
        # Used for backwards compatibility.
        stateVersion = lib.mkForce 5;
      };
      # Override user's home directory.
      users.users."${username}".home = lib.mkForce "/Users/${username}";
      # This is important to find command path (e.g. nix, darwin-rebuild).
      programs.zsh.enable = true;
      # Install packages in operating system.
      environment.systemPackages = with pkgs; [
        alacritty
        wezterm
        mkalias
      ];
    };
in
nix-darwin.lib.darwinSystem {
  # Make inherited variables accessible to modules.
  # Caution: DO NOT rename `specialArgs`.
  inherit specialArgs;
  # Merge modules.
  modules = [
    # This modules id defined above in "let" expression.
    configuration

    ./modules/nix-core.nix
    ./modules/host-users.nix
    ./modules/darwin-system.nix
    ./modules/fonts.nix

    # Home Manager settings.
    home-manager.darwinModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${username} = import ../home/darwin.nix;
      home-manager.extraSpecialArgs = specialArgs;
    }
  ];
}
