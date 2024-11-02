{ pkgs, ... }:
{
  imports = [
    ./yazi
    ./neovim
    ./erdtree
    ./nushell
    ./starship

    ./git.nix
    ./zsh.nix
    ./bash.nix
    ./btop.nix
    ./zellij.nix
  ];

  # Allow unfree software to by installed.
  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  xresources.properties = {
    # Set mouse cursor size.
    "Xcursor.size" = 16;
    # Set system font size.
    "Xft.dpi" = 172;
  };

  home.packages = with pkgs; [
    # cli tools
    translate-shell
    kubectl
    ripgrep
    lazygit
    tokei
    tree
    just
    file

    # linters and formatters
    shfmt # shell formatter
    shellcheck # shell linter
    nixfmt-rfc-style # nix formatter

    # language servers
    # find all language servers here:
    # https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
    vscode-langservers-extracted # html, cssls, json, eslint (e.g. js, ts)
    bash-language-server # bash shell
    yaml-language-server # yaml
    lua-language-server # lua
    rust-analyzer # rust
    lemminx # xml, svg
    helm-ls # helm
    ruff # python
    taplo # toml
    nil # nix
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";
  home.enableNixpkgsReleaseCheck = false;
}
