{ pkgs, pkgs-stable, ... }:
{
  programs.btop = {
    enable = true;
    # package = pkgs-stable.btop;
    settings = {
      theme_background = false;
      vim_keys = true;
      update_ms = 500;
      proc_tree = true;
    };
  };
}
