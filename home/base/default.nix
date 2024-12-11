{ pkgs, ... }:
{
  imports = [
    ./git
    ./yazi
    ./nvim
    ./erdtree
    ./nushell
    ./starship
    ./direnv

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
    # required by neovim
    tree-sitter
    python312

    # required by neovim plugins
    yarn-berry # render-markdown.nvim
    nodejs_22 # render-markdown.nvim
    ripgrep # telescope.nvim
    fd # telescope.nvim

    # utilities
    translate-shell
    onefetch
    kubectl
    lazygit
    tokei
    tree
    just
    file
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
