{ pkgs, ... }:
{
  programs.gpg = {
    enable = true;
  };
  services.gpg-agent = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    pinentry.package = pkgs.pinentry-tty;
  };
  home.packages = with pkgs; [ pinentry-tty ];
}
