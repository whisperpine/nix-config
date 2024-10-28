{ config, pkgs, pkgs-stable, ... }:

{
  imports = [
    ./btop.nix
    ./starship.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "yusong";
  home.homeDirectory = "/home/yusong";
  home.enableNixpkgsReleaseCheck = false;

  xresources.properties = {
    # Set mouse cursor size.
    "Xcursor.size" = 16;
    # Set system font size.
    "Xft.dpi" = 172;
  };

  home.packages = with pkgs; [
    neofetch
    kubectl
    zellij
    just
    tree
    yazi
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      kc = "kubectl";
      vim = "nvim";
    };
    # .bashrc
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
    '';
  };

  programs.git = {
    enable = true;
    userName = "Yusong";
    userEmail = "yusong.lai@icloud.com";
    aliases = {
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      pushff = "push --force-with-lease --force-if-includes";
      sc = "sparse-checkout";
      sm = "submodule";
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";
}
