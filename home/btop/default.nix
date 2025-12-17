{ ... }:
# --- monitor of resources --- #
{
  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      color_theme = "everforest-dark-medium";
      vim_keys = true;
      update_ms = 500;
      proc_tree = true;
      rounded_corners = false;
    };
  };
}
