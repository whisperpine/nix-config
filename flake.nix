{
  description = "Yusong's NixOS Config";

  # # The nixConfig here only affects the flake itself, not the system configuration.
  # nixConfig = {
  #   substituters = [
  #     # Query the mirror of USTC first, and then the official cache.
  #     "https://mirrors.ustc.edu.cn/nix-channels/store"
  #     "https://cache.nixos.org"
  #   ];
  # };

  # The `outputs` function will return all the build results of the flake.
  outputs = inputs: import ./outputs inputs;

  # `inputs` are the dependencies of the flake, Each item in `inputs` will be
  # passed as a parameter to the `outputs` function after being pulled and built.
  inputs = {
    #---------- common ----------#
    # Use the unstable branch by default.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # The latest stable branch which can be used as a fallback.
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";
    # This is dedicated to install zellij "0.43.1".
    nixpkgs-zellij.url = "github:NixOS/nixpkgs/09061f748ee21f68a089cd5d91ec1859cd93d0be";
    # To install the nightly version of Neovim.
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    # Run unpatched dynamic binaries.
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Secrept provisioning by sops-nix.
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Home Manager used for managing user configuration.
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      # The `follows` keyword in inputs is used for inheritance.
      # `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #---------- apps ----------#
    # Bookokrat.
    bookokrat.url = "github:bugzmanov/bookokrat/v0.3.11";
    # Zen browser.
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    # ---------- WSL ---------- #
    # WSL (Windows Subsystem for Linux).
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    # ---------- darwin ---------- #
    # Nix-Darwin.
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
