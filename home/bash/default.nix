{ ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = builtins.readFile ./.bashrc;
    shellAliases = {
      ap = "ansible-playbook";
      av = "ansible-vault";
      ai = "ansible-inventory";
      ad = "ansible-doc";
      ag = "ansible-galaxy";
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
}
