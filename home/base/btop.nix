{ ... }:
{
  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      vim_keys = true;
      update_ms = 500;
      proc_tree = true;
    };
  };
}
