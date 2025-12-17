{ pkgs, ... }:
{
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";
  home.enableNixpkgsReleaseCheck = false;

  imports = [
    # --- shell --- #
    ./zsh # zsh configs
    ./bash # bash configs
    ./starship # prompt for shells
    ./atuin # better shell history

    # --- git --- #
    ./gh # github cli tool
    ./git # git configs and extensions

    # --- tui --- #
    ./nvim # my favorite test editor
    ./btop # monitor of resources
    ./yazi # terminal file manager

    # --- utilities --- #
    ./zoxide # history-aware cd command
    ./bat # "cat" with syntax highlighting
    ./pgcli # cli for postgresql
  ];

  home.packages = with pkgs; [
    # Manage home-manager itself.
    home-manager

    # "nvim-tree" requires gcc to compile parsers.
    gcc # gnu compiler collection

    # "age" is used in conjunction with "sops".
    # (e.g. "outputs/modules/sops-nix.nix")
    age # a modern encryption tool
    sops # secrets operations

    difftastic # an alternative to diff
    tree # show a directory as a tree
    ouch # compression and decompression
    eza # a modern alternative to ls
    dig # DNS lookup utility
    jq # a json processor
  ];
}
