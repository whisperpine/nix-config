{
  self, nixpkgs, nixpkgs-stable, home-manager, nix-darwin, nix-homebrew, ...
}@inputs: let
  system = "aarch64-darwin";
  # Pass non-defualt args to modules.
  extraSpecialArgs = {
    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
  };
  configuration = { pkgs, config, ... }: {
    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = system;
    # Auto upgrade nix package and the daemon service.
    services.nix-daemon.enable = true;
    # System configurations.
    system = {
      # Set Git commit hash for darwin-version.
      configurationRevision = self.rev or self.dirtyRev or null;
      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      stateVersion = 5;
    };
    # Enable experimental features.
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    # Optimise storage.
    nix.settings.auto-optimise-store = true;
    # Set system-wide environment variables.
    environment.variables = {
      EDITOR = "nvim";
      SHELL = "/etc/profiles/per-user/yusong/bin/nu";
    };
    # This is important to find command path (e.g. nix, darwin-rebuild).
    programs.zsh.enable = true;
    # Allow unfree software to be installed.
    nixpkgs.config.allowUnfree = true;
    # Install packages in operating system.
    environment.systemPackages = with pkgs; [
      alacritty
      mkalias
    ];
    # Install fonts.
    fonts.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "CascadiaMono" ]; })
      noto-fonts-cjk-sans
    ];
    # HomeBrew.
    homebrew = {
      enable = true;
      brews = [
        "mas"
      ];
      casks = [
        "the-unarchiver"
      ];
      masApps = {
        # "Pixelmator Pro" = 1289583905;
      };
      # Only install apps declared in configurations,
      # and uninstall apps that are no longer declared.
      onActivation.cleanup = "zap";
      onActivation.autoUpdate = true;
      onActivation.upgrade = true;
    };
    # Fix macOS Spotlight indexing issue.
    system.activationScripts.applications.text = let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
    in
      pkgs.lib.mkForce ''
        # Set up applications.
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read src; do
          app_name=$(basename "$src")
          echo "copying $src" >&2
          ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done
      '';
    # System user settings.
    users.users.yusong = {
      name = "yusong";
      home = "/Users/yusong";
    };
    # System preference.
    system.defaults = {
      dock.autohide = true;
      finder.FXPreferredViewStyle = "clmv";
      NSGlobalDomain.AppleInterfaceStyle = "Dark";
      NSGlobalDomain.KeyRepeat = 2;
    };
  };
in
nix-darwin.lib.darwinSystem {
  modules = [
    # This modules id defined above in "let" expression.
    configuration

    # Home Manager settings.
    home-manager.darwinModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.yusong = import ../home/darwin.nix;
      home-manager.extraSpecialArgs = extraSpecialArgs;
    }

    # nix-homebrew settings.
    nix-homebrew.darwinModules.nix-homebrew {
      nix-homebrew = {
        # Install Homebrew under the default prefix.
        enable = true;
        # Also install Homebrew under the default Intel prefix for Rosetta 2.
        enableRosetta = true;
        # User owning the Homebrew prefix
        user = "yusong";
      };
    }
  ];
}
