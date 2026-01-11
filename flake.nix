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
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    # Used to pin blender version (circumvent long building time).
    nixpkgs-blender.url = "github:NixOS/nixpkgs/5f02c91314c8ba4afe83b256b023756412218535";
    # To install the nightly version of Neovim.
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    # Run unpatched dynamic binaries.
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Secrept provisioning by sops-nix
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Home Manager used for managing user configuration.
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      # The `follows` keyword in inputs is used for inheritance.
      # `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
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
