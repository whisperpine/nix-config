{
  description = "Yusong's NixOS Config";

  outputs = inputs: import ./outputs inputs;

  inputs = {
    # Use the unstable branch by default.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # The latest stable branch which can be used as a fallback.
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";

    # WSL (Windows Subsystem for Linux).
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    # Nix-Darwin.
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

}
