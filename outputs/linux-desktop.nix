input@{
  nixpkgs,
  nixpkgs-stable,
  home-manager,
  sops-nix,
  nix-ld,
  system,
  ...
}:
let
  username = "yusong";
  # Pass non-default args to modules.
  # Caution: DO NOT rename `specialArgs`.
  specialArgs = input // {
    pkgs-stable = import nixpkgs-stable { inherit system; };
    # Inhereit variables define above.
    inherit username;
  };
  configuration =
    { pkgs, config, ... }:
    let
      # pkgs.google-chrome is unfree.
      googleChrome =
        if pkgs.stdenv.hostPlatform.system == "aarch64-linux" then pkgs.hello else pkgs.google-chrome;
    in
    {
      # Bootloader.
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.kernelModules = [
        "i2c-dev" # "ddcutil" requires this module
      ];
      # Enable dconf so that system preferences (e.g. dark theme) can be set.
      programs.dconf.enable = true;
      # Install firefox.
      programs.firefox.enable = true;
      # Allow unfree software to be installed (e.g. google-chrome).
      nixpkgs.config.allowUnfree = true;
      # Install packages in operating system.
      environment.systemPackages = with pkgs; [ neovim ] ++ [ googleChrome ];
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
    ./modules/services/journald.nix
    ./modules/wireguard.nix
    ./modules/docker.nix
    ./modules/fonts.nix
    ./modules/steam.nix
    ./modules/i18n.nix
    ./modules/xdg.nix

    # Install bun packages globally.
    ./modules/services/bun-add.nix

    # Auto generated hardware configs (DO NOT MODIFY).
    ./modules/hardware/yunix.nix
    # Nvidia GPU configs.
    ./modules/hardware/nvidia.nix

    # Peripherals regarding audio, printing, etc.
    ./modules/services/peripherals.nix

    # The windowing system.
    ./modules/services/xserver.nix

    # Only use this module in conjunction with a proxy.
    ./modules/networking.nix

    # sops-nix module differs in linux and darwin.
    sops-nix.nixosModules.sops
    ./modules/sops-nix.nix

    # Enable nix-ld system-wide to run dynamic binaries.
    nix-ld.nixosModules.nix-ld

    # Home Manager as a module.
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${username} = import ../home/linux-desktop.nix;
      home-manager.extraSpecialArgs = specialArgs;
    }
  ];
}
