{ pkgs, ... }:
{
  imports = [
    ./yazi
    ./neovim
    ./erdtree
    ./nushell
    ./starship
    ./direnv

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

    # linters
    shellcheck # shell linter

    # formatters
    # find all formatters here:
    # https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
    nixfmt-rfc-style # nix formatter
    markdownlint-cli # markdown
    superhtml # html
    shfmt # shell formatter
    deno # javascript, typescript, json

    # language servers
    # find all language servers here:
    # https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
    vscode-langservers-extracted # json, css
    typescript-language-server # typescript, javascript
    tailwindcss-language-server # tailwind css
    bash-language-server # bash shell
    yaml-language-server # yaml
    lua-language-server # lua
    markdown-oxide # markdown
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
