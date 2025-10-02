{
  # pkgs,
  ...
}:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = builtins.readFile ./.bashrc;
    shellAliases = {
      ap = "ansible-playbook";
      av = "ansible-vault";
      za = "zellij attach";
      kc = "kubectl";
      lg = "lazygit";
      vim = "nvim";
      e = "eza";
      el = "eza -l";
    };
  };

  # Key bindings for bash.
  home.file.".inputrc".source = ./.inputrc;

  # # atuin bash integration also requires ble.sh
  # home.packages = with pkgs; [ blesh ];
  # xdg.configFile.blesh = {
  #   source = ./blesh-init.sh;
  #   target = "./blesh/init.sh";
  # };
}
